import 'package:flutter/material.dart';

class AnswerItemModel {
  final int id;
  final String title;
  final VoidCallback onPressed;

  final bool isCorrect;

  AnswerItemModel({
    required this.id,
    required this.title,
    required this.onPressed,
    this.isCorrect = false,
  });

  factory AnswerItemModel.fromMap(Map<String, dynamic> map) {
    return AnswerItemModel(
      id: map['id'] as int,
      title: map['title'] as String,
      onPressed: map['onPressed'] as VoidCallback,
      isCorrect: map['isCorrect'] as bool,
    );
  }
}
