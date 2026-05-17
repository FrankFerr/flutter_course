import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final void Function() onTap;
  final String answerText;

  @override
  Widget build(BuildContext constext) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 212, 159, 80),
          foregroundColor: const Color.fromARGB(255, 240, 240, 240),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
        onPressed: onTap,
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 18,
            shadows: [
              Shadow(offset: Offset(1.2, 1.2), blurRadius: 0.6),
              Shadow(offset: Offset(1.8, 1.8), blurRadius: 0.6),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
