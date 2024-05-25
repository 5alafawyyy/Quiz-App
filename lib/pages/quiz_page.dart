import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';
import 'package:quiz_app/models/question_item_model.dart';
import 'package:quiz_app/widgets/total_score_part.dart';
import 'package:quiz_app/widgets/answer_item.dart';
import 'package:quiz_app/widgets/question_item.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0, totalScore = 0;
  bool showTotalScore = false;
  late int answerChosenId = -1;
  bool isUserSelectAnyAnswer = true;
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    progress = (questionIndex / questions.length) + (1 / questions.length);
    List<AnswerItemModel> availbleAnswers =
        questions[questionIndex].availableAnswers;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
      ),
      body: !showTotalScore
          ? SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: QuestionItem(questionIndex: questionIndex),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 20.0),
                              Text(
                                'Step ${questionIndex + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                ' of ${questions.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade400,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                            minHeight: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 20.0),
                            ...List.generate(
                              availbleAnswers.length,
                              (index) {
                                AnswerItemModel answerItemModel =
                                    availbleAnswers[index];
                                return AnswerItem(
                                  answerItemModel: answerItemModel,
                                  isAnswerChosen:
                                      answerChosenId == answerItemModel.id,
                                  questionIndexChangeCallback: () {
                                    setState(() {
                                      answerChosenId = answerItemModel.id;
                                      isUserSelectAnyAnswer = true;
                                    });
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20.0),
                            Visibility(
                              visible: !isUserSelectAnyAnswer,
                              child: Text(
                                "Please select an answer",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 50.0,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (answerChosenId == -1) {
                                setState(() {
                                  isUserSelectAnyAnswer = false;
                                });

                                return;
                              } else {
                                if (availbleAnswers
                                    .where((answerItemModel) =>
                                        answerItemModel.id == answerChosenId)
                                    .first
                                    .isCorrect) {
                                  totalScore += 10;
                                }
                              }
                              if (questionIndex + 1 < questions.length) {
                                setState(() {
                                  answerChosenId = -1;
                                  questionIndex++;
                                });
                              } else {
                                setState(() {
                                  showTotalScore = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                            child: const Text("Next"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : TotalScorePart(
              totalScore: totalScore,
              resetQuizOnPressed: () {
                setState(
                  () {
                    answerChosenId = -1;
                    questionIndex = 0;
                    totalScore = 0;
                    showTotalScore = false;
                  },
                );
              },
            ),
    );
  }
}
