import 'package:flutter/material.dart';
import 'package:cinemasync/themes/theme.dart';
import 'package:cinemasync/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: buildTheme(),
      // darkTheme: buildThemeDark(),
      home: HomeView(),
    );
  }
}
