import 'package:flutter/material.dart';
import 'package:_06_expense_tracker_responsive/widgets/expense/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:_06_expense_tracker_responsive/theme/app_theme.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 51, 182, 106),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 15, 96, 62),
);

AppTheme appTheme = AppTheme(
  lightColorScheme: kColorScheme,
  darkColorScheme: kDarkColorScheme,
);

void main() {
  initializeDateFormatting('it_IT', null).then(
    (_) => runApp(
      MaterialApp(
        home: const Expenses(),
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
      ),
    ),
  );
}
