import 'package:flutter/material.dart';
import 'package:quiz_app/results_screen/questions_summary/index_badge.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summaryData, {super.key});

  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IndexBadge(
            index: (summaryData['question_index'] as int),
            isCorrect:
                summaryData['user_answer'] == summaryData['correct_answer'],
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryData['question'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  summaryData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 29, 28, 28),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  summaryData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 175, 203, 226),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
