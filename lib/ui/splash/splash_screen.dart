import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'check_login_action.dart';

class SplashConnector extends StatelessWidget {
  const SplashConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _Factory(this),
      onInitialBuild: (context, store, vm) =>
          store.dispatch(CheckLoginAction(ModalRoute.of(context!)!)),
      builder: (BuildContext context, _ViewModel vm) => _SplashPage(),
    );
  }
}

class _Factory extends VmFactory<AppState, SplashConnector, _ViewModel> {
  _Factory(SplashConnector super.widget);

  @override
  _ViewModel fromStore() => _ViewModel(authorized: state.loginState.authorized);
}

class _ViewModel extends Vm {
  final bool? authorized;

  _ViewModel({required this.authorized}) : super(equals: [authorized]);
}

class _SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppMark(),
                SizedBox(height: 32),
                SizedBox(width: 120, child: LinearProgressIndicator()),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _AppVersion()),
        ],
      ),
    );
  }
}

/// "v1.0.2 (3)": the version and build number from pubspec.yaml. Fades in,
/// since it isn't known on the first frame.
class _AppVersion extends StatelessWidget {
  const _AppVersion();

  static final Future<PackageInfo> _info = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 24),
      child: FutureBuilder<PackageInfo>(
        future: _info,
        builder: (context, snapshot) {
          final info = snapshot.data;
          final build = info?.buildNumber ?? "";
          final text = info == null
              ? ""
              : build.isEmpty
              ? "v${info.version}"
              : "v${info.version} ($build)";
          return AnimatedOpacity(
            opacity: info == null ? 0 : 1,
            duration: const Duration(milliseconds: 200),
            child: Text(
              text,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        },
      ),
    );
  }
}
