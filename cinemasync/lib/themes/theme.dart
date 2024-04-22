import 'package:flutter/material.dart';
import 'package:cinemasync/themes/colorScheme.dart';
import 'package:cinemasync/themes/textTheme.dart';
import 'package:cinemasync/themes/appBarTheme.dart';

final ThemeData base = ThemeData.light();

// ThemeData buildThemeLight() {
//   return base.copyWith(
//       colorScheme: colorSchemeLight,
//       textTheme: buildTextTheme(base.textTheme, colorSchemeLight),
//       appBarTheme: buildAppBarTheme(base.appBarTheme, colorSchemeLight));
// }

ThemeData buildTheme() {
  return base.copyWith(
      colorScheme: colorScheme,
      textTheme: buildTextTheme(base.textTheme, colorScheme),
      appBarTheme: buildAppBarTheme(base.appBarTheme, colorScheme));
}
