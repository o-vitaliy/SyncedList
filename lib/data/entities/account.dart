import 'package:flutter/foundation.dart';

/// The signed-in Firebase user, as far as the UI needs it.
@immutable
class Account {
  final String uid;
  final bool isAnonymous;
  final String? name;
  final String? email;
  final String? photoUrl;

  const Account({
    required this.uid,
    required this.isAnonymous,
    this.name,
    this.email,
    this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          uid == other.uid &&
          isAnonymous == other.isAnonymous &&
          name == other.name &&
          email == other.email &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode => Object.hash(uid, isAnonymous, name, email, photoUrl);
}

/// How linking a sign-in provider to the anonymous account went.
enum LinkResult {
  /// The provider was attached to the anonymous account; same uid, same lists.
  linked,

  /// The provider already belonged to another account, which is now signed
  /// in; the guest's lists must be added to it.
  switchedAccount,
}
