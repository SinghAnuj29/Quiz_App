import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.resultRestart, {
    super.key,
    required this.choosenAnswers,
  });

  final void Function() resultRestart;

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You have answered $numCorrectQuestions Out of $numTotalQuestions correctly',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 213, 225, 235),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: resultRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
