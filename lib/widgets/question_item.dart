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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          questions[questionIndex].title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.black),
        ),
        const SizedBox(height: 6.0),
        Text(
          "Answer and get points",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.grey,
                fontSize: 20.0,
              ),
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
