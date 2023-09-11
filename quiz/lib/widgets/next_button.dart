import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextQuestion});

  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: dogalRenk,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: const Text(
          "Next Question", textAlign: TextAlign.center, // textalign'e bak
        ),
      ),
    );
  }
}
