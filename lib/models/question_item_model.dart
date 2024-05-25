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
        imageUrl: "assets/images/football.png",
      ),
      AnswerItemModel(
        id: 2,
        title: "Cricket",
        onPressed: () => debugPrint("Cricket"),
        imageUrl: "assets/images/cricket.png",
      ),
      AnswerItemModel(
        id: 3,
        title: "Tennis",
        onPressed: () => debugPrint("Tennis"),
        imageUrl: "assets/images/tennis.png",
      ),
      AnswerItemModel(
        id: 4,
        title: "Volleyball",
        onPressed: () => debugPrint("Volleyball"),
        imageUrl: "assets/images/volleyball.png",
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
        imageUrl: "assets/images/red.png",
      ),
      AnswerItemModel(
        id: 2,
        title: "Blue",
        onPressed: () => debugPrint("Blue"),
        imageUrl: "assets/images/blue.png",
      ),
      AnswerItemModel(
        id: 3,
        title: "Green",
        onPressed: () => debugPrint("Green"),
        imageUrl: "assets/images/green.png",
      ),
      AnswerItemModel(
        id: 4,
        title: "Black",
        onPressed: () => debugPrint("Black"),
        imageUrl: "assets/images/black.png",
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
        imageUrl: "assets/images/cat.png",
      ),
      AnswerItemModel(
        id: 2,
        title: "Dog",
        onPressed: () => debugPrint("Dog"),
        imageUrl: "assets/images/dog.png",
      ),
      AnswerItemModel(
        id: 3,
        title: "Lion",
        onPressed: () => debugPrint("Lion"),
        imageUrl: "assets/images/lion.png",
        isCorrect: true,
      ),
      AnswerItemModel(
        id: 4,
        title: "Tiger",
        onPressed: () => debugPrint("Tiger"),
        imageUrl: "assets/images/tiger.png",
      ),
    ],
  ),
  QuestionItemModel(
    id: 4,
    title: 'What is your favourite bird?',
    availableAnswers: [
      AnswerItemModel(
        id: 1,
        title: "Bird",
        onPressed: () => debugPrint("Bird"),
        imageUrl: "assets/images/bird.png",
        isCorrect: true,
      ),
      AnswerItemModel(
        id: 2,
        title: "Owl",
        onPressed: () => debugPrint("Owl"),
        imageUrl: "assets/images/owl.png",
      ),
      AnswerItemModel(
        id: 3,
        title: "Pigeon",
        onPressed: () => debugPrint("Pigeon"),
        imageUrl: "assets/images/pigeon.png",
      ),
      AnswerItemModel(
        id: 4,
        title: "Raven",
        onPressed: () => debugPrint("Raven"),
        imageUrl: "assets/images/raven.png",
      ),
    ],
  ),
];
