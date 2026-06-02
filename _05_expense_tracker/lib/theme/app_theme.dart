import 'package:flutter/material.dart';

final ThemeData themeDark = ThemeData.dark();
final ThemeData themeLight = ThemeData();

class AppTheme {
  const AppTheme({
    required ColorScheme lightColorScheme,
    required ColorScheme darkColorScheme,
  }) : _lightColorScheme = lightColorScheme,
       _darkColorScheme = darkColorScheme;

  final ColorScheme _lightColorScheme;
  final ColorScheme _darkColorScheme;

  ThemeData get lightTheme {
    return _getDefaultTheme(themeLight, _lightColorScheme);
  }

  ThemeData get darkTheme {
    return _getDefaultTheme(themeDark, _darkColorScheme);
  }

  ThemeData _getDefaultTheme(ThemeData theme, ColorScheme colorScheme) {
    return theme.copyWith(
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: colorScheme.onPrimaryContainer,
        foregroundColor: colorScheme.primaryContainer,
      ),
      cardTheme: const CardThemeData().copyWith(
        color: colorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
        ),
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSecondaryContainer,
          fontSize: 20,
        ),
      ),
    );
  }
}
