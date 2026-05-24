import 'package:flutter/material.dart';

class NumberEditingController extends TextEditingController {
  int get number {
    if (super.text.isEmpty) return -1;

    int lenght = super.text.contains(',')
        ? super.text.indexOf(',')
        : super.text.length;

    return int.parse(super.text.substring(0, lenght));
  }

  double get numberWithDecimal {
    if (super.text.isEmpty) return -1;

    return double.parse(super.text.replaceFirst(',', '.'));
  }
}
