import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/style/colors.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/test_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/result_details.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/widget_result_box.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/presentation/widgets/widget_result_page_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/result_model.dart';
import '../../../../core/routes/app_route_name.dart';

class Result extends StatelessWidget {
  final VoidCallback backToBeginning;
  const Result(this.backToBeginning, {super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Provider.of<TestController>(context, listen: false);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        const SizedBox(height: 20),
        ResultBox(controller),
        const SizedBox(height: 100),
        ResultPageButton(
          text: "Restart the test",
          onPressed: backToBeginning,
        ),
        const SizedBox(height: 20),
        ResultPageButton(
          onPressed: () => context.go(AppRouteName.home),
          text: "Return to main menu",
        ),
        const SizedBox(height: 50),
        const Row(
          children: [
            Expanded(child: Divider()),
            SizedBox(width: 10),
            Text("Your result",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(width: 10),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        ...List<Widget>.generate(controller.results.length, (index){
          final ResultModel resultModel = controller.results[index];
          final Color color = resultModel.isCorrect == null
              ? Colors.amber
              : resultModel.isCorrect == true
              ? AppColors.primaryGreen
              : Colors.red;
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Stack(
              alignment: const Alignment(1.06, -1.2),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => ResultDetails(
                      context: context,
                      resultModel: resultModel,
                      index: index
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: color, width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${resultModel.question}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: "Correct answer: ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),
                                children: [
                                  TextSpan(
                                    text: "${resultModel.correctAnswer}\n",
                                    style: const TextStyle(fontWeight: FontWeight.w400)
                                  ),
                                  const TextSpan(
                                    text: "Your answer: ",
                                    style: TextStyle(fontWeight: FontWeight.w500)
                                  ),
                                  TextSpan(
                                    text: "${resultModel.userAnswer}\n",
                                    style: const TextStyle(fontWeight: FontWeight.w400)
                                  ),
                                  const TextSpan(
                                    text: "Total Score: ",
                                    style: TextStyle(fontWeight: FontWeight.w500)
                                  ),
                                  TextSpan(
                                    text: resultModel.totalScore.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w400)
                                  ),
                                ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: color)
                    ),
                    child: Icon(
                      resultModel.isCorrect == null
                          ? Icons.close
                          : resultModel.isCorrect == true
                          ? Icons.done
                          : Icons.close,
                      color: color
                    ),
                  ),
                )
              ],
            ),
          );
        }),
        const SizedBox(height: 85),
      ],
    );
  }
}
