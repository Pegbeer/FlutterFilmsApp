import 'package:flutter/material.dart';

class LightTheme {
  static final defaultColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

  static ThemeData base = ThemeData.light(useMaterial3: true);

  static ThemeData theme = base.copyWith(
      colorScheme: defaultColorScheme,
      brightness: Brightness.light,
      useMaterial3: true,
      appBarTheme: base.appBarTheme.copyWith(elevation: 0, centerTitle: true),
      iconTheme: base.iconTheme.copyWith(color: defaultColorScheme.primary),
      textTheme: base.textTheme);
}
