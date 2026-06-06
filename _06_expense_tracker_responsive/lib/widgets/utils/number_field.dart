import 'package:_06_expense_tracker_responsive/widgets/utils/number_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// FilteringTextInputFormatter.allow(RegExp(r'\d+,?\d{0,2}'))

class NumberField extends TextField {
  NumberField({
    NumberEditingController? controller,
    super.decoration,
    super.key,
  }) : super(
         controller: controller,
         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
         keyboardType: TextInputType.number,
       );

  NumberField.amount({
    NumberEditingController? controller,
    InputDecoration? decoration,
    int decimals = 2,
    super.key,
  }) : super(
         controller: controller,
         inputFormatters: [],
         decoration: decoration?.copyWith(prefixText: '€ '),
         keyboardType: TextInputType.number,
       ) {
    _numberDecimalsPattern = RegExp('^\\d*,?\\d{0,$decimals}\$');

    inputFormatters!.add(
      const TextInputFormatter.withFunction(_formatDecimalNumberFunction),
    );
  }

  static RegExp _numberDecimalsPattern = RegExp(r'^\d*,?\d*$');

  static TextEditingValue _formatDecimalNumberFunction(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _numberDecimalsPattern.hasMatch(newValue.text) ? newValue : oldValue;
  }
}
