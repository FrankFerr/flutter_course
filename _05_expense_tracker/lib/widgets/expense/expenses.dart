import 'package:_05_expense_tracker/widgets/expense/expenses_list/expenses_list.dart';
import 'package:_05_expense_tracker/model/expense.dart';
import 'package:_05_expense_tracker/widgets/expense/new_expense.dart';
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
          const Text('chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onDissmissedExpense: _onDissmissedExpense,
            ),
          ),
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
