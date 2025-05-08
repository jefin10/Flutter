import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({required this.answerText ,required this.onTap, super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build( context) {
    return ElevatedButton(onPressed: onTap, child: Text(answerText),
    style: ElevatedButton.styleFrom(

    ),);
  }
}