import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen/questions_summary/questions_summary.dart';
import 'package:quiz_app/results_screen/restart_button.dart';

const TEXT_COLOR = Color.fromARGB(255, 175, 222, 226);

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.restartQuiz,
  });

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final int totalCorrectAnswer = summaryData
        .where((entry) => entry['user_answer'] == entry['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $totalCorrectAnswer out of $totalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: TEXT_COLOR,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 20),
            RestartButton(restartQuiz: restartQuiz),
          ],
        ),
      ),
    );
  }
}
