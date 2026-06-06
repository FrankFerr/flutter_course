import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd('it_IT');
final NumberFormat numberFormatter = NumberFormat.currency(
  locale: 'it_IT',
  name: 'EUR',
  symbol: '€',
);
const UUID = Uuid();

enum Category { food, travel, leisure, work }

const Map<Category, IconData> _categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = UUID.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);

  String get formattedAmount => numberFormatter.format(amount);

  Icon get categoryIcon => Icon(_categoryIcons[category]);
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  double get totalExpenses {
    double sum = 0;

    for (final Expense expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }

  IconData get categoryIconData => _categoryIcons[category]!;
}
