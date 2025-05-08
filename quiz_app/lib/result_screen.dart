import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key, 
    required this.choosenAnswers,
    required this.onRestart, // Add this parameter
  });
  
  final List<String> choosenAnswers;
  final void Function() onRestart; // Define the function type
  
  List<Map<String , Object>> getSummaryData() {
    final List<Map<String , Object>> summary = [];
    for(var i=0;i<choosenAnswers.length;i++){
     
      //////////
      //
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':questions[i].answers[0],
        'choosen_answer':choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
  final numTotalQuestions = questions.length;
  final numCorrectAnswers = summaryData.where((data) {
    return data['correct_answer'] == data['choosen_answer'];
  }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
            'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
            SizedBox(height: 40,),
            QuestionsSummary(summary: getSummaryData()),

            SizedBox(height: 40,),
            TextButton(
            onPressed: onRestart,
            child: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
