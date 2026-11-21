// Push notifications for the web app (see functions/src/index.ts).
//
// The Firebase Messaging SDK registers this worker itself, at its own scope
// (/firebase-cloud-messaging-push-scope), so it lives next to sw.js, which
// handles offline caching for the whole site. It shows pushes that arrive
// while the app is in the background; the push's tag is the list id, so a
// newer push for a list replaces the older one.
//
// Keep the SDK version in step with the one FlutterFire loads
// (supportedFirebaseJsSdkVersion in firebase_core_web).

// Runs before the SDK's own click handler, which would open a second tab.
// A tap focuses an open app window and asks it to open the list (index.html
// listens for this), or opens the app at /?openList=<id>.
self.addEventListener('notificationclick', (event) => {
  const message = event.notification.data && event.notification.data.FCM_MSG;
  const listId = message && message.data && message.data.listId;
  if (!listId) return; // Not ours: let the SDK handle it.

  event.stopImmediatePropagation();
  event.notification.close();
  const url = '/?openList=' + encodeURIComponent(listId);
  event.waitUntil(
    (async () => {
      const windows = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });
      const app = windows.find((c) => new URL(c.url).origin === self.location.origin);
      if (app) {
        await app.focus();
        app.postMessage({ type: 'openList', listId: listId });
      } else {
        await self.clients.openWindow(url);
      }
    })(),
  );
});

importScripts('https://www.gstatic.com/firebasejs/13.3.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/13.3.0/firebase-messaging-compat.js');

// Same values as DefaultFirebaseOptions.web in lib/firebase_options.dart.
firebase.initializeApp({
  apiKey: 'AIzaSyCdia5bCbqsPuK7z3jECQT64a3l7N8NVpU',
  appId: '1:361380982242:web:0fe79fe33ab3155fe29dbb',
  messagingSenderId: '361380982242',
  projectId: 'whattobuy-e3713',
  authDomain: 'whattobuy-e3713.firebaseapp.com',
  storageBucket: 'whattobuy-e3713.appspot.com',
});

// Pushes with a `notification` part are shown by the SDK; nothing else to do.
firebase.messaging();
