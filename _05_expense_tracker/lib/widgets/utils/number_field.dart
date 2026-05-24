import 'package:_05_expense_tracker/widgets/utils/number_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextInputFormatter _filterNumber = FilteringTextInputFormatter.digitsOnly;
final TextInputFormatter _filterDecimal = FilteringTextInputFormatter.allow(
  RegExp(r'\d+,?\d*'),
);

class NumberField extends TextField {
  NumberField({
    NumberEditingController? controller,
    super.decoration,
    super.key,
  }) : super(
         controller: controller,
         inputFormatters: [_filterNumber],
         keyboardType: TextInputType.number,
       );

  NumberField.amount({
    NumberEditingController? controller,
    InputDecoration? decoration,
    super.key,
  }) : super(
         controller: controller,
         inputFormatters: [_filterDecimal],
         decoration: decoration?.copyWith(prefixText: '€ '),
         keyboardType: TextInputType.number,
       );
}
