import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      );
}

Widget defaultSpacer() => const SizedBox(width: 16, height: 16);

Widget defaultSpacer8() => const SizedBox(width: 8, height: 8);

void showSnack(BuildContext context, String message) {
  final snackbar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
