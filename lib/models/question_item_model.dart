import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class QuestionItemModel {
  final String title;
  final List<AnswerItemModel> availableAnswers;

  QuestionItemModel({required this.title, required this.availableAnswers});

  factory QuestionItemModel.fromMap(Map<String, dynamic> map) {
    return QuestionItemModel(
      title: map['title'] as String,
      availableAnswers: List<AnswerItemModel>.from(
        (map['answerItemModel'] as List<int>).map<AnswerItemModel>(
          (x) => AnswerItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

List<QuestionItemModel> questions = [
  QuestionItemModel(
    title: 'What is your favourite sport?',
    availableAnswers: [
      AnswerItemModel(
        title: "Football",
        onPressed: () => debugPrint("Football"),
      ),
      AnswerItemModel(
        title: "Cricket",
        onPressed: () => debugPrint("Cricket"),
      ),
      AnswerItemModel(
        title: "Tennis",
        onPressed: () => debugPrint("Tennis"),
      ),
      AnswerItemModel(
        title: "Volleyball",
        onPressed: () => debugPrint("Volleyball"),
      ),
    ],
  ),
  QuestionItemModel(
    title: 'What is your favourite color?',
    availableAnswers: [
      AnswerItemModel(
        title: "Red",
        onPressed: () => debugPrint("Red"),
      ),
      AnswerItemModel(
        title: "Blue",
        onPressed: () => debugPrint("Blue"),
      ),
      AnswerItemModel(
        title: "Green",
        onPressed: () => debugPrint("Green"),
      ),
      AnswerItemModel(
        title: "Black",
        onPressed: () => debugPrint("Black"),
      ),
    ],
  ),
  QuestionItemModel(
    title: 'What is your favourite animal?',
    availableAnswers: [
      AnswerItemModel(
        title: "Cat",
        onPressed: () => debugPrint("Cat"),
      ),
      AnswerItemModel(
        title: "Dog",
        onPressed: () => debugPrint("Dog"),
      ),
      AnswerItemModel(
        title: "Lion",
        onPressed: () => debugPrint("Lion"),
      ),
      AnswerItemModel(
        title: "Tiger",
        onPressed: () => debugPrint("Tiger"),
      ),
    ],
  ),
  QuestionItemModel(
    title: 'What is your favourite bird?',
    availableAnswers: [
      AnswerItemModel(
        title: "Flutter",
        onPressed: () => debugPrint("Flutter"),
      ),
      AnswerItemModel(
        title: "Owl",
        onPressed: () => debugPrint("Owl"),
      ),
      AnswerItemModel(
        title: "Pigeon",
        onPressed: () => debugPrint("Pigeon"),
      ),
      AnswerItemModel(
        title: "Raven",
        onPressed: () => debugPrint("Raven"),
      ),
    ],
  ),
];
