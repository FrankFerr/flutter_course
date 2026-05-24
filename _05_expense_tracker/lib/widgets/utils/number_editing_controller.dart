import 'package:flutter/material.dart';

class NumberEditingController extends TextEditingController {
  int? get number {
    if (super.text.isEmpty) return null;

    int length = super.text.contains(',')
        ? super.text.indexOf(',')
        : super.text.length;

    return int.tryParse(super.text.substring(0, length));
  }

  double? get numberWithDecimal {
    if (super.text.isEmpty) return null;

    return double.tryParse(super.text.replaceFirst(',', '.'));
  }
}
