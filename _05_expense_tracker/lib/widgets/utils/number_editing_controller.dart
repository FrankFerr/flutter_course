import 'package:flutter/material.dart';

class NumberEditingController extends TextEditingController {
  int get number {
    if (super.text.isEmpty) return -1;

    return int.parse(super.text.replaceFirst(RegExp(r',\d*'), ''));
  }

  double get numberWithDecimal {
    if (super.text.isEmpty) return -1;

    return double.parse(super.text.replaceFirst(',', '.'));
  }
}
