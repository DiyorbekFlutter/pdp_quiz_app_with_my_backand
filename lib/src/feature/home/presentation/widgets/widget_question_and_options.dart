import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/modules_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/widget_option_button.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/widget_timer_circle_avatar.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../controller/test_controller.dart';

class QuestionAndOptions extends StatelessWidget {
  final String stage;
  final Question question;
  final Future<void> Function() nextPage;

  const QuestionAndOptions({
    super.key,
    required this.stage,
    required this.question,
    required this.nextPage
  });

  @override
  Widget build(BuildContext context) {
    final TestController controller = Provider.of<TestController>(context);
    controller.correctAnswerIndex = question.answer == question.option1 ? 0 : question.answer == question.option2 ? 1 : 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 15),
          SizedBox(
            height: 192,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 161,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 51, bottom: 18, left: 15, right: 15),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Text(
                              question.question,
                              style: const AppTextStyle().labelSmall?.copyWith(fontSize: 15)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TimerCircleAvatar(() => controller.handleTimerEnd(
                  nextPage: nextPage,
                  question: question.question,
                  correctAnswer: question.answer
                )),
              ],
            ),
          ),
          const SizedBox(height: 80),

          OptionButton(
            style: controller.styleList[0],
            option: "A. ${question.option1}",
            onPressed: () => controller.updateStyles(
              currentIndex: 0,
              nextPage: nextPage,
              question: question.question,
              correctAnswer: question.answer,
              userAnswer: question.option1,
              stage: stage
            ),
          ),
          const SizedBox(height: 20),
          OptionButton(
            style: controller.styleList[1],
            option: "B. ${question.option2}",
            onPressed: () => controller.updateStyles(
              currentIndex: 1,
              nextPage: nextPage,
              question: question.question,
              correctAnswer: question.answer,
              userAnswer: question.option2,
              stage: stage
            ),
          ),
          const SizedBox(height: 20),
          OptionButton(
            style: controller.styleList[2],
            option: "C. ${question.option3}",
            onPressed: () => controller.updateStyles(
              currentIndex: 2,
              nextPage: nextPage,
              question: question.question,
              correctAnswer: question.answer,
              userAnswer: question.option3,
              stage: stage
            ),
          ),
        ],
      ),
    );
  }
}
