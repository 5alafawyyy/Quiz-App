import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class AnswerItem extends StatefulWidget {
  const AnswerItem({
    super.key,
    required this.answerItemModel,
    required this.questionIndexChangeCallback,
    required this.isAnswerChosen,
  });

  final AnswerItemModel answerItemModel;
  final VoidCallback questionIndexChangeCallback;
  final bool isAnswerChosen;

  @override
  State<AnswerItem> createState() => _AnswerItemState();
}

class _AnswerItemState extends State<AnswerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.answerItemModel.onPressed();
        widget.questionIndexChangeCallback();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
            height: 50.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: widget.isAnswerChosen ? Colors.green : Colors.white,
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: widget.isAnswerChosen
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    child: ImageIcon(
                      AssetImage(widget.answerItemModel.imageUrl),
                      color:
                          widget.isAnswerChosen ? Colors.green : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    widget.answerItemModel.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: widget.isAnswerChosen
                              ? Colors.white
                              : Colors.black,
                          fontSize: 15.0,
                        ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
