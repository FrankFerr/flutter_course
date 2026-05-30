import 'package:flutter/material.dart';
import 'package:_05_expense_tracker/widgets/expense/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 51, 182, 106),
);

void main() {
  initializeDateFormatting('it_IT', null).then(
    (_) => runApp(
      MaterialApp(
        home: const Expenses(),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
        ),
      ),
    ),
  );
}
