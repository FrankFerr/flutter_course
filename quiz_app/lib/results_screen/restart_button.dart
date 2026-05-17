import 'package:flutter/material.dart';
import 'package:quiz_app/results_screen/results_screen.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({super.key, required this.restartQuiz});

  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.refresh),
      label: const Text("Restart Quiz!", style: TextStyle(fontSize: 18)),
      onPressed: restartQuiz,
      style: TextButton.styleFrom(foregroundColor: TEXT_COLOR, iconSize: 22),
    );
  }
}
