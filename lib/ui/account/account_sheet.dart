import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/account.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/settings/actions/theme_action_change.dart';
import 'package:shopping_list/ui/widgets/dialogs.dart';

import 'actions/account_action_link.dart';
import 'actions/account_action_sign_out.dart';

/// App bar button showing the user's avatar; opens [AccountSheet].
class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Account?>(
      converter: (store) => store.state.loginState.account,
      builder: (context, account) => IconButton(
        tooltip: AppLocalizations.of(context).account,
        onPressed: () => showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (_) => const AccountSheet(),
        ),
        icon: AccountAvatar(account: account, radius: 16),
      ),
    );
  }
}

class AccountAvatar extends StatelessWidget {
  final Account? account;
  final double radius;

  const AccountAvatar({super.key, required this.account, this.radius = 28});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final account = this.account;
    final label = account?.name ?? account?.email;
    final photo = account?.photoUrl;
    return CircleAvatar(
      radius: radius,
      backgroundColor: scheme.secondaryContainer,
      foregroundColor: scheme.onSecondaryContainer,
      foregroundImage: photo == null ? null : NetworkImage(photo),
      child: label == null || label.isEmpty
          ? Icon(Icons.person_outline, size: radius)
          : Text(
              label.characters.first.toUpperCase(),
              style: TextStyle(
                fontSize: radius * 0.8,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

class AccountSheet extends StatelessWidget {
  const AccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _Factory(this),
      builder: (context, vm) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Header(account: vm.account),
              const SizedBox(height: 24),
              if (vm.account?.isAnonymous ?? true)
                ..._guestActions(context, vm)
              else
                _signOutButton(context, vm),
              const SizedBox(height: 28),
              _ThemePicker(current: vm.themeMode, onChanged: vm.setTheme),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _guestActions(BuildContext context, _ViewModel vm) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final enabled = !vm.linking;
    return [
      Text(
        l.guestInfo,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      const SizedBox(height: 16),
      FilledButton.icon(
        onPressed: enabled ? () => vm.link(SignInProvider.google) : null,
        icon: const Icon(Icons.account_circle_outlined),
        label: Text(l.loginExecuteGoogle),
      ),
      const SizedBox(height: 12),
      FilledButton.tonalIcon(
        onPressed: enabled ? () => vm.link(SignInProvider.facebook) : null,
        icon: const Icon(Icons.facebook),
        label: Text(l.loginExecuteFacebook),
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 4,
        child: vm.linking ? const LinearProgressIndicator() : null,
      ),
    ];
  }

  Widget _signOutButton(BuildContext context, _ViewModel vm) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.error,
        side: BorderSide(color: scheme.outlineVariant),
      ),
      icon: const Icon(Icons.logout),
      label: Text(l.signOut),
      onPressed: () => confirmDialog(
        context,
        l.signOutConfirm,
        // Sign-out navigates to /login and removes every route, sheet included.
        vm.signOut,
        icon: Icons.logout,
        confirmLabel: l.signOut,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Account? account;

  const _Header({required this.account});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final account = this.account;
    final guest = account?.isAnonymous ?? true;
    final title = guest ? l.guest : (account?.name ?? account?.email ?? "");
    final subtitle = guest
        ? null
        : (account?.name != null ? account?.email : null) ?? l.signedInWith;

    return Row(
      children: [
        AccountAvatar(account: guest ? null : account),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ThemePicker extends StatelessWidget {
  final AppThemeMode current;
  final ValueChanged<AppThemeMode> onChanged;

  const _ThemePicker({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.themeTitle,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<AppThemeMode>(
            showSelectedIcon: false,
            selected: {current},
            onSelectionChanged: (s) => onChanged(s.first),
            segments: [
              ButtonSegment(
                value: AppThemeMode.system,
                icon: const Icon(Icons.brightness_auto_outlined),
                label: Text(l.themeSystem),
              ),
              ButtonSegment(
                value: AppThemeMode.light,
                icon: const Icon(Icons.light_mode_outlined),
                label: Text(l.themeLight),
              ),
              ButtonSegment(
                value: AppThemeMode.dark,
                icon: const Icon(Icons.dark_mode_outlined),
                label: Text(l.themeDark),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Factory extends VmFactory<AppState, AccountSheet, _ViewModel> {
  _Factory(AccountSheet super.widget);

  @override
  _ViewModel fromStore() => _ViewModel(
    account: state.loginState.account,
    themeMode: state.themeMode,
    linking: isWaiting(AccountActionLink),
    link: (provider) => dispatch(AccountActionLink(provider)),
    signOut: () => dispatch(AccountActionSignOut()),
    setTheme: (mode) => dispatch(ThemeActionChange(mode)),
  );
}

class _ViewModel extends Vm {
  final Account? account;
  final AppThemeMode themeMode;
  final bool linking;
  final ValueChanged<SignInProvider> link;
  final VoidCallback signOut;
  final ValueChanged<AppThemeMode> setTheme;

  _ViewModel({
    required this.account,
    required this.themeMode,
    required this.linking,
    required this.link,
    required this.signOut,
    required this.setTheme,
  }) : super(equals: [account, themeMode, linking]);
}
