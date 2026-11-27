/// Whether this install may show push notifications.
enum PushPermission {
  /// Not available here, e.g. Safari on iPhone outside a Home Screen app.
  unsupported,

  /// The user hasn't been asked yet.
  notAsked,
  granted,

  /// Turned off by the user; only the browser or system settings can undo it.
  denied,
}
