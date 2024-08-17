import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/test_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/result_text.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class ResultBox extends StatelessWidget {
  final TestController controller;
  const ResultBox(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Align(
              alignment: const Alignment(0, -0.7),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white.withOpacity(0.3),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Your\nresult\n",
                        style: const AppTextStyle().headline5?.copyWith(color: AppColors.primaryGreen),
                        children: [
                          TextSpan(
                            text: controller.calculateTotalScore,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0.2),
                      blurRadius: 1
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResultText("${controller.calculateCorrectAnswers} correct answers", AppColors.primaryGreen),
                    ResultText("${controller.calculateIncorrectAnswers} incorrect answers", Colors.red),
                    ResultText("${controller.calculateNoPressedAnswers} no pressed answers", Colors.amber),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
