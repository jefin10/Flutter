import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen); // Pass the switchScreen function to the Home widget
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();  // Switch screen when button is pressed
    });
  }

  @override
  Widget build(context) {
    return activeScreen;  // Display active screen
  }
}
