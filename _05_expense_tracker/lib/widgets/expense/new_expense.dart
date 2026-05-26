import 'package:_05_expense_tracker/widgets/utils/number_editing_controller.dart';
import 'package:_05_expense_tracker/widgets/utils/number_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:_05_expense_tracker/model/expense.dart';

final formatter = DateFormat.yMd('it_IT');

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onSaved, super.key});

  final void Function(Expense) onSaved;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = NumberEditingController();
  DateTime? _selectedDate;
  Category? _category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          // Title TextField -------------------------->
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              // Amount NumberField ---------------------------->
              Expanded(
                child: NumberField.amount(
                  controller: _amountController,
                  decoration: const InputDecoration(label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 16),
              // Date DatePicker ------------------------------->
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _onPressedCalendarIcon,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Category Dropdown ------------------------->
              DropdownButton(
                value: _category,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem<Category>(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
              ),
              const Spacer(),
              // Cancel Button ------------------------------->
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              // Save Button ------------------------------->
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Save expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onPressedCalendarIcon() async {
    final DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpense() {
    final bool isInvalid =
        _titleController.text.trim().isEmpty ||
        _amountController.numberWithDecimal == null ||
        _amountController.numberWithDecimal! <= 0 ||
        _selectedDate == null ||
        _category == null;

    if (isInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid data'),
          content: const Text(
            'Please, make sure a valid title, amount, date and category was entered',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay!'),
            ),
          ],
        ),
      );

      return;
    }

    Expense newExpense = Expense(
      title: _titleController.text.trim(),
      amount: _amountController.numberWithDecimal!,
      date: _selectedDate!,
      category: _category!,
    );

    widget.onSaved(newExpense);

    Navigator.pop(context);
  }
}
