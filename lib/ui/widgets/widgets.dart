import 'package:material_ui/material_ui.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

Widget defaultSpacer() => const SizedBox(width: 16, height: 16);

Widget defaultSpacer8() => const SizedBox(width: 8, height: 8);

/// The app's mark: a cart in a rounded, tinted square.
class AppMark extends StatelessWidget {
  final double size;

  const AppMark({super.key, this.size = 88});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: Icon(
        Icons.shopping_cart_outlined,
        size: size * 0.5,
        color: scheme.onPrimaryContainer,
      ),
    );
  }
}

/// Centered placeholder for an empty screen: icon, title, explanation.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 96),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                color: scheme.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 52, color: scheme.onSecondaryContainer),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "More" menu entry: icon plus label.
PopupMenuItem<VoidCallback> menuAction(
  IconData icon,
  String label,
  VoidCallback action, {
  Color? color,
}) {
  return PopupMenuItem<VoidCallback>(
    value: action,
    child: Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Text(label, style: color == null ? null : TextStyle(color: color)),
      ],
    ),
  );
}

/// Lets [defaultToast] show messages without a BuildContext; set on MaterialApp.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void defaultToast(String msg) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(msg), duration: const Duration(seconds: 4)),
  );
}
