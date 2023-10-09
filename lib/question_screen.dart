import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];
    // we can wrap the column widget with center also as we use to do but the sized box is the new apporach
    return SizedBox(
      // width as double infinity takes the whole screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 147, 143, 229),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            //using map functions to convert the value to widgets and using dot operators to convert multiple to comma separated values
            ...currentQuestion.getShuffledAnswers().map((answers) {
              return AnswerButton(
                answerText: answers,
                onTap: () {
                  answerQuestion(answers);
                },
              );
            })
            /* 
            General way of executing the answers for buttons
            AnswerButton(
              answerText: currentQuestion.answers[0],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answers[1],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answers[2],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answers[3],
              onTap: () {},
            ), */
          ],
        ),
      ),
    );
  }
}
