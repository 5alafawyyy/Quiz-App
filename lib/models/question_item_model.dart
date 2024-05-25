import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class QuestionItemModel {
  final int id;
  final String title;
  final List<AnswerItemModel> availableAnswers;

  QuestionItemModel({
    required this.id,
    required this.title,
    required this.availableAnswers,
  });

  factory QuestionItemModel.fromMap(Map<String, dynamic> map) {
    return QuestionItemModel(
      id: map['id'] as int,
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
    id: 1,
    title: 'What is your favourite sport?',
    availableAnswers: [
      AnswerItemModel(
        id: 1,
        title: "Football",
        onPressed: () => debugPrint("Football"),
        isCorrect: true,
      ),
      AnswerItemModel(
        id: 2,
        title: "Cricket",
        onPressed: () => debugPrint("Cricket"),
      ),
      AnswerItemModel(
        id: 3,
        title: "Tennis",
        onPressed: () => debugPrint("Tennis"),
      ),
      AnswerItemModel(
        id: 4,
        title: "Volleyball",
        onPressed: () => debugPrint("Volleyball"),
      ),
    ],
  ),
  QuestionItemModel(
    id: 2,
    title: 'What is your favourite color?',
    availableAnswers: [
      AnswerItemModel(
        id: 1,
        title: "Red",
        onPressed: () => debugPrint("Red"),
      ),
      AnswerItemModel(
        id: 2,
        title: "Blue",
        onPressed: () => debugPrint("Blue"),
      ),
      AnswerItemModel(
        id: 3,
        title: "Green",
        onPressed: () => debugPrint("Green"),
      ),
      AnswerItemModel(
        id: 4,
        title: "Black",
        onPressed: () => debugPrint("Black"),
        isCorrect: true,
      ),
    ],
  ),
  QuestionItemModel(
    id: 3,
    title: 'What is your favourite animal?',
    availableAnswers: [
      AnswerItemModel(
        id: 1,
        title: "Cat",
        onPressed: () => debugPrint("Cat"),
      ),
      AnswerItemModel(
        id: 2,
        title: "Dog",
        onPressed: () => debugPrint("Dog"),
      ),
      AnswerItemModel(
        id: 3,
        title: "Lion",
        onPressed: () => debugPrint("Lion"),
        isCorrect: true,
      ),
      AnswerItemModel(
        id: 4,
        title: "Tiger",
        onPressed: () => debugPrint("Tiger"),
      ),
    ],
  ),
  QuestionItemModel(
    id: 4,
    title: 'What is your favourite bird?',
    availableAnswers: [
      AnswerItemModel(
        id: 1,
        title: "Flutter",
        onPressed: () => debugPrint("Flutter"),
        isCorrect: true,
      ),
      AnswerItemModel(
        id: 2,
        title: "Owl",
        onPressed: () => debugPrint("Owl"),
      ),
      AnswerItemModel(
        id: 3,
        title: "Pigeon",
        onPressed: () => debugPrint("Pigeon"),
      ),
      AnswerItemModel(
        id: 4,
        title: "Raven",
        onPressed: () => debugPrint("Raven"),
      ),
    ],
  ),
];
