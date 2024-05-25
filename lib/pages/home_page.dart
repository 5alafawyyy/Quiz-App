import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/app_state.dart';
import 'package:quiz_app/models/question_item_model.dart';
import 'package:quiz_app/widgets/answer_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appStateProvider = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 10.0,
        actions: [
          IconButton.outlined(
            onPressed: () {
              setState(() {
                appStateProvider.useMaterial3 = !appStateProvider.useMaterial3;
              });
            },
            icon: Icon(
              appStateProvider.useMaterial3
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  questions[questionIndex].title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headlineLarge!.color,
                  ),
                ),
              ),
              ...questions[questionIndex].availableAnswers.map(
                    (answerItemModel) => AnswerItem(
                      answerItemModel: answerItemModel,
                      questionIndexChangeCallback: () {
                        if (questionIndex + 1 < questions.length) {
                          setState(() {
                            questionIndex++;
                          });
                        }
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
