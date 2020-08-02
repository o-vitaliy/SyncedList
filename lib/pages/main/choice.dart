import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon, this.action});

  final String title;
  final IconData icon;
  final Function action;
}
