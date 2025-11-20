
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreCardScreen(),
    );
  }
}

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade600,
      body: ListView(
        children: [
          DisplayCard(label: "My score in flutter"),
          DisplayCard(label: "My score in Dart"),
          DisplayCard(label: "My score in React"),
        ],
      ),
    );
  }
}

class DisplayCard extends StatelessWidget {
  const DisplayCard({super.key, this.label = "My Score Card"});
  
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProgressBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  int score = 1;
  int maxScore = 10;

  void increasesScore() {
    setState(() {
      if (score < maxScore) {
        score++;
      }
    });
  }

  void decreasesScore() {
    setState(() {
      if (score > 1) {
        score--;
      }
    });
  }

Color getProgressColor() {
  if (score <= 3) {  
    return Colors.lightGreen.shade300;
  } else if (score <= 5) {
    return Colors.lightGreen.shade500;
  } else if (score <= 7) {
    return Colors.lightGreen.shade700;
  } else {
    return Colors.green.shade900;
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.grey, size: 50),
              onPressed: decreasesScore,
            ),
            SizedBox(width: 100),
            IconButton(
              icon: Icon(Icons.add, color: Colors.grey, size: 50),
              onPressed: increasesScore,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth * (score / maxScore),
                    decoration: BoxDecoration(
                      color: getProgressColor(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}