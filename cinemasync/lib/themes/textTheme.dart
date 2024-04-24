// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:cinemasync/themes/colorScheme.dart';

// https://api.flutter.dev/flutter/material/TextTheme-class.html

// https://api.flutter.dev/flutter/painting/TextStyle-class.html

TextTheme buildTextTheme(TextTheme original, ColorScheme colorScheme) {
  return original.copyWith(
    //title: buildTextStyle(colorScheme.onPrimary),
    displayLarge: buildTextStyle(colorScheme.onBackground),
    displayMedium: buildTextStyle(colorScheme.onBackground),
    displaySmall: buildTextStyle(colorScheme.onBackground),
    headlineLarge: buildTextStyle(colorScheme.onBackground),
    headlineMedium: buildTextStyle(colorScheme.onBackground),
    //Used for large text in dialogs
    //(e.g., the month and year in the dialog shown by showDatePicker)
    headlineSmall: buildTextStyle(colorScheme.onBackground),
    //Used for the primary text in app bars and dialogs
    //(e.g., AppBar.title and AlertDialog.title).
    titleLarge: buildTextStyle(colorScheme.onBackground),
    //Used for the primary text in lists (e.g., ListTile.title)
    //and the TextField edited text.
    titleMedium: buildTextStyle(colorScheme.onBackground),
    //For medium emphasis text that's a little smaller than subtitle1
    titleSmall: buildTextStyle(colorScheme.onBackground),
    //Used for emphasizing text that would otherwise be bodyText2.
    bodyLarge: buildTextStyle(colorScheme.onBackground),
    //The default text style for material.
    //Color for ListTile.trailing
    bodyMedium: buildTextStyle(colorScheme.onBackground),
    //Used for auxiliary text with images.
    //Used for ListTile.subtile
    bodySmall: buildTextStyle(colorScheme.onBackground),
    //Used for text on ElevatedButton, TextButton, and OutlinedButton
    //if no others
    labelLarge: buildTextStyle(colorScheme.onBackground),
    labelMedium: buildTextStyle(colorScheme.onBackground),
    labelSmall: buildTextStyle(colorScheme.onBackground),
  );
}

TextStyle? buildTextStyle(
  Color color, {
  double size = defaultFontSize,
  FontWeight weight = defaultFontWeight,
  FontStyle fontStyle = defaultFontStyle,
}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    fontStyle: fontStyle,
    letterSpacing: defaultLetterSpacing,
  );
}

const double defaultFontSize = 30;
const FontWeight defaultFontWeight = FontWeight.w500;
const FontStyle defaultFontStyle = FontStyle.normal;
const defaultLetterSpacing = 0.09;
