{{flutter_js}}
{{flutter_build_config}}

// No serviceWorkerSettings: Flutter's own service worker only unregisters
// itself, and registering it would replace sw.js (see index.html).
_flutter.loader.load();
