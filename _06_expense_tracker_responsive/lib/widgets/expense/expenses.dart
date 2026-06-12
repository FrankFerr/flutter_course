import 'package:_06_expense_tracker_responsive/widgets/chart/chart.dart';
import 'package:_06_expense_tracker_responsive/widgets/expense/expenses_list/expenses_list.dart';
import 'package:_06_expense_tracker_responsive/model/expense.dart';
import 'package:_06_expense_tracker_responsive/widgets/expense/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 24.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 12.50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDissmissedExpense: _onDissmissedExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onSaved: _onSavedExpense),
    );
  }

  void _onSavedExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _onDissmissedExpense(int idx) {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    Expense expenseDeleted = _registeredExpenses[idx];

    setState(() {
      _registeredExpenses.removeAt(idx);
    });

    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        persist: false,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(idx, expenseDeleted);
            });
          },
        ),
        content: Text('${expenseDeleted.title} expense successfully deleted'),
      ),
    );
  }
}
