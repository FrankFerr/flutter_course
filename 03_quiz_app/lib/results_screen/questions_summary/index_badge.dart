import 'package:flutter/material.dart';

class IndexBadge extends StatelessWidget {
  const IndexBadge({super.key, required this.index, required this.isCorrect});

  final int index;
  final bool isCorrect;

  static const Color _CORRECT_ANSWER_COLOR = Color.fromARGB(255, 0, 116, 132);
  static const Color _WRONG_ANSWER_COLOR = Color.fromARGB(255, 220, 52, 52);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: 40,
  //     height: 40,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       color: isCorrect ? _CORRECT_ANSWER_COLOR : _WRONG_ANSWER_COLOR,
  //       borderRadius: const BorderRadius.all(Radius.circular(20)),
  //     ),
  //     child: Text(
  //       (index + 1).toString(),
  //       style: const TextStyle(
  //         color: Colors.white70,
  //         fontSize: 18,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCorrect ? _CORRECT_ANSWER_COLOR : _WRONG_ANSWER_COLOR,
      foregroundColor: const Color.fromARGB(255, 175, 222, 226),
      child: Text((index + 1).toString()),
    );
  }
}
