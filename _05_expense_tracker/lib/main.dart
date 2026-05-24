import 'package:flutter/material.dart';
import 'package:_05_expense_tracker/widgets/expense/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting(
    'it_IT',
    null,
  ).then((_) => runApp(const MaterialApp(home: Expenses())));
}
