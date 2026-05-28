// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryRed = Color(0xFFCC0000);
  static const Color accentYellow = Color(0xFFFFCB05);
  static const Color darkBg = Color(0xFF1A1A2E);
  static const Color darkCard = Color(0xFF16213E);
  static const Color darkSurface = Color(0xFF0F3460);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryRed,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: const CardThemeData(
  color: darkCard,
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
),
        fontFamily: 'Roboto',
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryRed,
          brightness: Brightness.dark,
          surface: darkBg,
        ),
        scaffoldBackgroundColor: darkBg,
        cardColor: darkCard,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkCard,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: const CardThemeData(
  color: darkCard,
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
),
        fontFamily: 'Roboto',
      );
}
