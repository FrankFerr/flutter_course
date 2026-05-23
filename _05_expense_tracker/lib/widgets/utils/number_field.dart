import 'package:_05_expense_tracker/widgets/utils/number_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextInputFormatter _filterNumber = FilteringTextInputFormatter.digitsOnly;
final TextInputFormatter _filterDecimal = FilteringTextInputFormatter.allow(
  RegExp(r'\d+,?\d*'),
);

class NumberField extends StatelessWidget {
  NumberField({
    required String title,
    required NumberEditingController controller,
    super.key,
  }) : _title = title,
       _controller = controller,
       _prefix = null,
       formatter = _filterNumber;

  NumberField.amount({
    required String title,
    required NumberEditingController controller,
    String prefix = '€ ',
    super.key,
  }) : _title = title,
       _controller = controller,
       _prefix = prefix,
       formatter = _filterDecimal;

  final String _title;
  final TextEditingController _controller;
  final String? _prefix;
  final TextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(label: Text(_title), prefixText: _prefix),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[formatter],
    );
  }
}
