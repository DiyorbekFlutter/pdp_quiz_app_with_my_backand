import 'package:flutter/material.dart';

import '../../../../core/components/build_show_dialog.dart';
import '../../../../core/models/result_model.dart';
import '../../../../core/style/colors.dart';

class ResultDetails extends BuildShowDialog {
  final ResultModel resultModel;
  final int index;

  ResultDetails({
    required super.context,
    required this.resultModel,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: resultModel.isCorrect == null
          ? Colors.amber
          : resultModel.isCorrect == true
          ? AppColors.primaryGreen
          : Colors.red,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index + 1}. ${resultModel.question}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "Correct answer: ",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white
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
    );
  }
}