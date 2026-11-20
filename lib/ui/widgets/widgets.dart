import 'package:material_ui/material_ui.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
    ),
  );
}

Widget defaultSpacer() => const SizedBox(width: 16, height: 16);

Widget defaultSpacer8() => const SizedBox(width: 8, height: 8);

void showSnack(BuildContext context, String message) {
  final snackbar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

class LabelButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LabelButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

/// Lets [defaultToast] show messages without a BuildContext; set on MaterialApp.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void defaultToast(String msg) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(msg), duration: const Duration(seconds: 4)),
  );
}
