import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class AnswerItem extends StatefulWidget {
  const AnswerItem({
    super.key,
    required this.answerItemModel,
    required this.questionIndexChangeCallback,
  });

  final AnswerItemModel answerItemModel;
  final VoidCallback questionIndexChangeCallback;

  @override
  State<AnswerItem> createState() => _AnswerItemState();
}

class _AnswerItemState extends State<AnswerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            widget.answerItemModel.onPressed();
            widget.questionIndexChangeCallback();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(widget.answerItemModel.title),
        ),
      ),
    );
  }
}
