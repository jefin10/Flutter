import "package:flutter/material.dart";

class Home extends StatelessWidget {
  final void Function() startQuiz;  // Accepting function to handle button press

  const Home(this.startQuiz, {super.key});  // Constructor now expects the function
  
  @override
  Widget build( context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/quiz-logo.png', width: 200,
            color: const Color.fromARGB(132, 255, 255, 255),
          ),
          SizedBox(height: 40),
          Text("Learn Flutter in a good way",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 40),

          OutlinedButton.icon(
              onPressed: startQuiz,  // This will now trigger the function passed from parent
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: Icon(Icons.star), // Just for example
              label: Text('Start Quiz'),
            )
        ],
      ),
    );
  }
}
