import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/modules_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/test_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/widget_home_details_app_bar.dart';
import '../widgets/widget_question_and_options.dart';
import '../widgets/widget_result.dart';

class TestPage extends StatelessWidget {
  final Department department;
  final String technologyId;
  final String title;
  final String stage;
  final String imageUrl;

  const TestPage({
    super.key,
    required this.department,
    required this.technologyId,
    required this.title,
    required this.stage,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final TestController controller = Provider.of<TestController>(context, listen: false)..results.clear();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeDetailsAppBar(
        title: title,
        imageUrl: imageUrl,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: department.questions.length,
        itemBuilder: (context, index) {
          final Question question = department.questions[index].shuffle;

          if(index + 1 == department.questions.length) {
            controller.submitScore(
              context: context,
              technologyId: technologyId,
              stage: stage,
            );
          }

          return index + 1 != department.questions.length ? QuestionAndOptions(
            stage: stage,
            question: question,
            nextPage: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              controller.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          }) : Result((){
            controller.pageController.animateToPage(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            controller.results.clear();
          });
        },
      ),
    );
  }
}
