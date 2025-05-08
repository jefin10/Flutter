import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;
  List<String> selectedAnswers=[];

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length ){
      setState(() {
        activeScreen = ResultScreen(choosenAnswers: selectedAnswers,onRestart: restartQuiz,);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen); 
  }

  void switchScreen() {
    setState(() {
      activeScreen =  QuestionsScreen(onSelectAnswer:chooseAnswer);  
    });
  }
  // In quiz.dart
void restartQuiz() {
  setState(() {
    selectedAnswers = []; 
    activeScreen = Home(switchScreen);
  });
}

  @override
  Widget build(context) {
    return activeScreen;  // Display active screen
  }
}
