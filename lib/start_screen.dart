import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
 const  StartScreen(this.startQuiz,{super.key});

 final void  Function() startQuiz;

  // List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learn  Flutter The Fun Way',
            style: TextStyle(
                color: Color.fromARGB(255, 237, 233, 252), fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
                side: const BorderSide(
                  color: Colors.black26,
                ),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start quiz'),
          ),
        ],
      ),
    );
  }
}
