import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {
  AppTheme({required this.isDarkmode});

  final bool isDarkmode;

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
      );
}
