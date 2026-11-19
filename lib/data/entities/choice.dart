import 'package:material_ui/material_ui.dart';

class Choice {
  const Choice({required this.title, required this.icon, required this.action});

  final String title;
  final IconData icon;
  final Function action;
}
