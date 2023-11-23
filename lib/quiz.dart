import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  /// class variable available  in the entire class
  var activeScreen = 'start-screen';

  List<String> selectedAnswer = [];

  //Widget? activeScreen;

  // Widget? activeScreen = StartScreen(switchScreen);

  // @override
  // void initState() {
  //   super.initState();
  //    activeScreen =  StartScreen(switchScreen);
  // }
  //
  // void switchScreen(){
  //  setState(() {
  //    activeScreen =  const QuestionScreen() ;
  //  });
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
       // selectedAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// variable only available inside of the build method
    // var screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : QuestionScreen(
    //         onSelectAnswer: chooseAnswer,
    //       );

    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
    screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen =='results-screen'){
           screenWidget =  ResultsScreen(chosenAnswers: selectedAnswer,);
   }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
