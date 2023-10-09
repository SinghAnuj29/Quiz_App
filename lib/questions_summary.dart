import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 213, 225, 235),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 213, 225, 235),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 213, 225, 235),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 88, 231, 124),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
