import 'package:flutter/material.dart';

import 'package:quiz_app/models/question_item_model.dart';
class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.questionIndex,
  });

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        questions[questionIndex].title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color:
              Theme.of(context).textTheme.headlineLarge!.color,
        ),
      ),
    );
  }
}