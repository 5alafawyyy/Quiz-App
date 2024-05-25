import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/app_state.dart';
import 'package:quiz_app/pages/home_page.dart';

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final useMaterialState = Provider.of<AppState>(context).useMaterial3;

    return Provider.value(
      value: useMaterialState,
      builder: (context, child) => MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: useMaterialState,
        ),
        home: const MyHomePage(title: 'Home'),
      ),
    );
  }
}
