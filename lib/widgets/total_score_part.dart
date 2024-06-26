import 'package:flutter/material.dart';

class TotalScorePart extends StatelessWidget {
  const TotalScorePart({
    super.key,
    required this.totalScore,
    required this.resetQuizOnPressed,
  });

  final int totalScore;
  final VoidCallback resetQuizOnPressed;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Congrats!",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                    ),
                  ),
                  Text(
                    "Your total Score is: $totalScore",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge!.color,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: resetQuizOnPressed,
                child: const Text(
                  "Restart Quiz",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
