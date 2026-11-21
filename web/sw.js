// Offline support for the installed web app (PWA).
//
// Flutter no longer ships a caching service worker, so this one keeps a copy
// of the app's files. The site's own files are fetched from the network first
// (Hosting serves them with `no-cache`, so a deploy shows up on the next
// load), and the cached copy is used only when that fails. Files from
// Google's CDNs (CanvasKit, the Firebase JS SDK, fonts) have the version in
// their URL, so the cached copy is used first.
//
// Firestore and Auth traffic is left alone; the Firestore SDK keeps its own
// offline cache in IndexedDB (see main.dart).
//
// Bump CACHE to throw away every cached file on the next visit.
const CACHE = 'syncedlist-v1';

// The app shell, cached on install. The rest (CanvasKit, fonts, assets) is
// sent by index.html after the first frame, and anything fetched later is
// cached as it goes.
const SHELL = [
  '/',
  'flutter_bootstrap.js',
  'main.dart.js',
  'manifest.json',
  'favicon.png',
  'icons/Icon-192.png',
];

const CDN_HOSTS = ['www.gstatic.com', 'fonts.gstatic.com', 'fonts.googleapis.com'];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE).then((cache) =>
      // One missing file shouldn't stop the worker from installing.
      Promise.all(SHELL.map((url) => cache.add(url).catch(() => {}))),
    ),
  );
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      const names = await caches.keys();
      await Promise.all(names.filter((n) => n !== CACHE).map((n) => caches.delete(n)));
      await self.clients.claim();
    })(),
  );
});

// index.html sends the URLs the page loaded before this worker took over.
self.addEventListener('message', (event) => {
  const data = event.data;
  if (!data || data.type !== 'cache' || !Array.isArray(data.urls)) return;
  event.waitUntil(
    (async () => {
      const cache = await caches.open(CACHE);
      await Promise.all(
        data.urls.map(async (href) => {
          let url;
          try {
            url = new URL(href);
          } catch (e) {
            return;
          }
          if (!handles(url) || (await cache.match(url.href))) return;
          try {
            // A CORS fetch, so the copy also works for module imports and
            // fetch(); an opaque (no-cors) copy would only work for <script>.
            const response = await fetch(url.href);
            if (response.ok) await cache.put(url.href, response);
          } catch (e) {
            // Offline, or no CORS: it is cached the next time the page loads it.
          }
        }),
      );
    })(),
  );
});

self.addEventListener('fetch', (event) => {
  const request = event.request;
  if (request.method !== 'GET') return;
  const url = new URL(request.url);
  if (!handles(url)) return;

  if (request.mode === 'navigate') {
    event.respondWith(navigate(request));
  } else if (sameOrigin(url)) {
    event.respondWith(networkFirst(request));
  } else {
    event.respondWith(cacheFirst(request));
  }
});

function sameOrigin(url) {
  return url.origin === self.location.origin;
}

function handles(url) {
  if (sameOrigin(url)) {
    // /__/ is Firebase Hosting's reserved path (the Auth sign-in handler).
    return !url.pathname.startsWith('/__/');
  }
  return url.protocol === 'https:' && CDN_HOSTS.includes(url.hostname);
}

function cacheable(response) {
  return response && (response.ok || response.type === 'opaque');
}

// Every app path (/, /link?id=…, /main) is rewritten to index.html, so offline
// a page that was never cached gets the app shell, which reads the URL itself.
async function navigate(request) {
  const cache = await caches.open(CACHE);
  try {
    const response = await fetch(request);
    if (response.ok) cache.put(request.url.split('?')[0], response.clone());
    return response;
  } catch (e) {
    return (
      (await cache.match(request, { ignoreSearch: true })) ||
      (await cache.match('/')) ||
      Response.error()
    );
  }
}

async function networkFirst(request) {
  const cache = await caches.open(CACHE);
  try {
    const response = await fetch(request);
    if (response.ok) cache.put(request, response.clone());
    return response;
  } catch (e) {
    return (await cache.match(request)) || Response.error();
  }
}

async function cacheFirst(request) {
  const cache = await caches.open(CACHE);
  const cached = await cache.match(request);
  // An opaque copy (cached from a <script> tag) can't answer a CORS request.
  if (cached && !(cached.type === 'opaque' && request.mode === 'cors')) return cached;
  const response = await fetch(request);
  if (cacheable(response)) cache.put(request, response.clone());
  return response;
}
