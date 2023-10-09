import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';

import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeState = 'start-screen';

  //one of doing the screen switch , other is the ternary operator wth string given above

  //Widget? activeState;
  //
  // @override
  // void initState() {
  //   activeState = StartScreen(switchScreen);
  //   super.initState();
  // }
  //  void switchScreen() {
  //   setState(() {
  //     activeState = const QuesitonScreen();
  //   });
  // }

  void switchScreen() {
    setState(() {
      activeState = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeState = 'results-screen';
      });
    }
  }

  void resultRestart() {
    setState(() {
      selectedAnswers = [];
      activeState = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    // changing screen with if statements
    Widget screenWidget = StartScreen(switchScreen);
    if (activeState == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeState == 'results-screen') {
      screenWidget = ResultsScreen(
        resultRestart,
        choosenAnswers: selectedAnswers,
      );
    }
    // if (activeState == 'start-screen') {
    //   screenWidget = ResultsScreen(
    //     resultRestart,
    //     choosenAnswers: selectedAnswers,
    //   );
    // }
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
          //by using if statements used below widget Build
          child: screenWidget,
          //one more of way of changing scren by ternary operator
          // child: activeState == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
        ),
      ),
    );
  }
}
