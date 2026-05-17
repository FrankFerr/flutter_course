import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen/results_screen.dart';

const String _START_SCREEN = 'start-screen';
const String _QUESTIONS_SCREEN = 'questions-screen';
const String _RESULTS_SCREEN = 'results-screen';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = _START_SCREEN;
  final List<String> answers = [];

  void startQuizScreen() {
    setState(() {
      activeScreen = _QUESTIONS_SCREEN;
    });
  }

  void restartQuizScreen() {
    setState(() {
      answers.clear();
      activeScreen = _QUESTIONS_SCREEN;
    });
  }

  void saveAnswer(String answer) {
    answers.add(answer);

    if (answers.length == questions.length) {
      setState(() {
        activeScreen = _RESULTS_SCREEN;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = switch (activeScreen) {
      _START_SCREEN => StartScreen(startQuizScreen),
      _QUESTIONS_SCREEN => QuestionsScreen(onSelectedAnswer: saveAnswer),
      _RESULTS_SCREEN => ResultsScreen(
        chosenAnswer: answers,
        restartQuiz: restartQuizScreen,
      ),
      _ => StartScreen(startQuizScreen),
    };

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                Color.fromARGB(255, 0, 116, 132),
                Color.fromARGB(255, 220, 52, 52),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
