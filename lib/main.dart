import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/app.dart';
import 'package:quiz_app/app/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyQuizApp(),
    ),
  );
}
