import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

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
  Scaffold.of(context).showSnackBar(snackbar);
}

void defaultToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black45,
      textColor: Colors.white);
}
