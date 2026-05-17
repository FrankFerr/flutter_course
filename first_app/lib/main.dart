import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 219, 116, 20),
        body: GradientContainer([
          Color.fromARGB(255, 88, 51, 9),
          Color.fromARGB(255, 189, 110, 21),
        ]),
      ),
    ),
  );
}
