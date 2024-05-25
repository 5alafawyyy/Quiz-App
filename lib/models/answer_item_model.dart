import 'package:flutter/material.dart';

class AnswerItemModel {
  final String title;
  final VoidCallback onPressed;

  AnswerItemModel({
    required this.title,
    required this.onPressed,
  });

  factory AnswerItemModel.fromMap(Map<String, dynamic> map) {
    return AnswerItemModel(
      title: map['title'] as String,
      onPressed: map['onPressed'] as VoidCallback,
    );
  }
}
