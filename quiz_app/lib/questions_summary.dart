import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});
  
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summary.map((item) {
        final isCorrect = item['choosen_answer'] == item['correct_answer'];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                radius: 14,
                child: Text(
                  ((item['question_index'] as int) + 1).toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['question'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Your answer: ${item['choosen_answer']}'),
                    Text('Correct answer: ${item['correct_answer']}'),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
