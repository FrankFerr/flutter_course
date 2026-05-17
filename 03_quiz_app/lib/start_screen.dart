import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.goToQuestions, {super.key});

  final void Function() goToQuestions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // RESOURCE EXPENSIVE
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset("assets/images/quiz-logo.png", width: 300),
          // ),
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 175, 222, 226),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () => goToQuestions(),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text("Start quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
