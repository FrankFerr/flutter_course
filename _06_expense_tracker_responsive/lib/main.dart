import 'package:flutter/material.dart';
import 'package:_06_expense_tracker_responsive/widgets/expense/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:_06_expense_tracker_responsive/theme/app_theme.dart';
import 'package:flutter/services.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Future<void> preferredOrientation = SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  // Future<void> initDateFormatting = initializeDateFormatting('it_IT', null);

  // await Future.wait([preferredOrientation, initDateFormatting]);

  await initializeDateFormatting('it_IT', null);

  runApp(
    MaterialApp(
      home: const Expenses(),
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
    ),
  );
}
