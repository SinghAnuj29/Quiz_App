import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assests/images/quiz-logo.png',
              color: const Color.fromARGB(150, 255, 255, 255),
              width: 300,
            ),
            // One way of giving transparency is wrapping with general widget names opactiy and giving the opactiy value
            // Opacity(
            //   opacity: 0.6,
            //   child: Image.asset(
            //     'assests/images/quiz-logo.png',
            //     width: 300,
            //   ),
            // ),
            const SizedBox(height: 70),
            Text(
              'Learn Flutter the Fun Way',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 96, 172, 235),
              ),
            ),
            const SizedBox(height: 70),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
            )
          ],
        ),
      ),
    );
  }
}



/* 


my solution for the start
Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 57, 9, 139),
                Color.fromARGB(255, 140, 96, 216),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assests/images/quiz-logo.png',
                ),
              ],
            ),
          ),
        ),
        
        
         */