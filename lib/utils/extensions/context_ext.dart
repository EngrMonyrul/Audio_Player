import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);

  double get topBarHeight => MediaQuery.of(this).padding.top;
}
