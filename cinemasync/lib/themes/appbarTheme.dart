// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:cinemasync/themes/colorScheme.dart';
import 'package:cinemasync/themes/textTheme.dart';

// Define the function with two arguments
AppBarTheme buildAppBarTheme(AppBarTheme original, ColorScheme cScheme) {
  return original.copyWith(
    color: cScheme.primary,
    titleTextStyle: buildTextStyle(
      cScheme.onPrimary,
      size: 30,
    ),
    centerTitle: true,
  );
}
