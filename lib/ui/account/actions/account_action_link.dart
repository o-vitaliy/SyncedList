import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app.dart';
import 'package:shopping_list/data/entities/account.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/repos/invites_repo.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/data/sources/auth/auth_datasource.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/list/user_list/actions/new_list_action_subscribe.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

enum SignInProvider { google, facebook }

/// Signs a guest (anonymous) user in with [provider] without losing lists.
///
/// Normally the provider is attached to the guest account, so the uid and its
/// lists stay. If the provider already has its own account, that account is
/// signed in instead and the guest's lists are added to it.
class AccountActionLink extends ReduxAction<AppState> {
  final SignInProvider provider;

  AccountActionLink(this.provider);

  @override
  Future<AppState?> reduce() async {
    final auth = GetIt.I.get<AuthRepo>();
    final lists = GetIt.I.get<ListsRepo>();

    final List<UserList> guestLists;
    final LinkResult result;
    try {
      // Read from Firestore, not the screen, so lists that haven't loaded yet
      // still come along if we end up switching to another account.
      guestLists = await lists.currentUserListsOnce();
      result = switch (provider) {
        SignInProvider.google => await auth.linkGoogle(),
        SignInProvider.facebook => await auth.linkFacebook(),
      };
    } on LoginCancelled {
      return null;
    } on FirebaseException catch (e) {
      throw UserException(e.message ?? "Some thing went wrong");
    } on UserException {
      rethrow;
    } catch (e) {
      throw UserException("Some thing went wrong", reason: "$e");
    }

    if (result == LinkResult.switchedAccount) {
      // The guest is signed out at this point, so a list that fails to move
      // is kept as a pending invite; NewListActionAddFromInvite retries those
      // at startup and after every login.
      final invites = GetIt.I.get<InviteRepos>();
      for (final list in guestLists) {
        try {
          await lists.addUserList(list.id);
        } catch (e) {
          debugPrint("Couldn't move list ${list.id}: $e");
          await invites.saveInvite(list.id, list.name);
        }
      }
      // The lists query is per user, so re-run it for the new account.
      dispatch(UserListActionSubscribe());
    }

    final context = navigatorKey.currentContext;
    if (context != null && context.mounted) {
      final l = AppLocalizations.of(context);
      defaultToast(
        result == LinkResult.linked ? l.accountLinked : l.accountSwitched,
      );
    }
    return null;
  }
}
