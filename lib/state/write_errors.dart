import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../main.dart';
import 'app_state.dart';

/// Firestore writes update the local cache right away, but their futures only
/// complete once the server confirms them, which never happens while offline.
/// So writes aren't awaited in actions; this reports a later failure (e.g. a
/// security-rules rejection) instead of dropping it.
void reportWriteFailure(Future<Object?> write) {
  write.catchError((Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    final message = error is FirebaseException ? error.message : null;
    mainStore.dispatch(
      UserExceptionAction<AppState>(message ?? "Some thing went wrong"),
    );
    return null;
  });
}
