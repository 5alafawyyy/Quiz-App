import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_item_model.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/widgets/answer_item.dart';
import 'package:quiz_app/widgets/question_item.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int totalScore = 0;
  bool showTotalScore = false;

  @override
  Widget build(BuildContext context) {
    questions[questionIndex].availableAnswers.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Page"),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: !showTotalScore
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  children: [
                    QuestionItem(questionIndex: questionIndex),
                    ...questions[questionIndex].availableAnswers.map(
                      (answerItemModel) {
                        return AnswerItem(
                          answerItemModel: answerItemModel,
                          questionIndexChangeCallback: () {
                            if (answerItemModel.isCorrect) {
                              totalScore += 10;
                            }
                            if (questionIndex + 1 < questions.length) {
                              setState(() {
                                questionIndex++;
                              });
                            } else {
                              setState(() {
                                showTotalScore = true;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : ResultPage(
              totalScore: totalScore,
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  totalScore = 0;
                  showTotalScore = false;
                });
              }),
    );
  }
}
