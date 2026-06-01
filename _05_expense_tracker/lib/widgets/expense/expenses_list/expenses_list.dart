import 'package:_05_expense_tracker/model/expense.dart';
import 'package:_05_expense_tracker/widgets/expense/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required void Function(int) onDissmissedExpense,
  }) : _onDissmissedExpense = onDissmissedExpense;

  final List<Expense> expenses;
  final void Function(int) _onDissmissedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withAlpha(200),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(expenses[index].id),
        onDismissed: (direction) {
          _onDissmissedExpense(index);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
