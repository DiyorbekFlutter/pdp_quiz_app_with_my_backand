import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/network_service.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/result_model.dart';

import '../../../core/storage/app_storage.dart';
import '../../../core/style/colors.dart';
import '../presentation/widgets/submit_score_error_dialog.dart';
import '../presentation/widgets/widget_option_button.dart';

class TestController with ChangeNotifier {
  /// api
  final String _apiSubmitScore = "/api/v1/home-add-ball";

  List<ResultModel> results = [];

  /// Timer
  int timer = 15;

  Timer startTimer(VoidCallback onTimerEnd) {
    return Timer.periodic(const Duration(seconds: 1), (_) {
      if (timer > 0) {
        timer--;
        notifyListeners();
      } else {
        _.cancel();
        onTimerEnd();
      }
    });
  }

  /// question and options
  late int correctAnswerIndex;
  bool canPressed = true;
  final PageController pageController = PageController();

  final List<OptionStyle> styleList = List<OptionStyle>.generate(3, (index) => OptionStyle(
    borderColor: AppColors.primaryGreen,
    backgroundColor: Colors.white,
    textColor: Colors.black
  ));

  void changeStyles(int index, Color backgroundColor){
    styleList[index].backgroundColor = backgroundColor;
    styleList[index].textColor = Colors.white;
    styleList[index].borderColor = null;
  }

  void updateStyles({
    required int currentIndex,
    required Future<void> Function() nextPage,
    required String question,
    required String correctAnswer,
    required String userAnswer,
    required String stage
  }) {
    if(!canPressed){
      return;
    } else if(currentIndex == correctAnswerIndex){
      changeStyles(currentIndex, AppColors.primaryGreen);
      results.add(ResultModel(
        question: question,
        correctAnswer: correctAnswer,
        userAnswer: userAnswer,
        isCorrect: true,
        totalScore: stage == "easy" ? timer : stage == "medium" ? timer * 2 : timer * 3
      ));
    } else {
      changeStyles(currentIndex, Colors.red);
      changeStyles(correctAnswerIndex, AppColors.primaryGreen);
      results.add(ResultModel(
        question: question,
        correctAnswer: correctAnswer,
        userAnswer: userAnswer,
        isCorrect: false,
        totalScore: 0
      ));
    }

    canPressed = false;
    notifyListeners();
    nextPage().then((value) {
      for(int i=0; i<3; i++){
        styleList[i].borderColor = AppColors.primaryGreen;
        styleList[i].backgroundColor = Colors.white;
        styleList[i].textColor = Colors.black;
      }
      canPressed = true;
    });
  }

  void handleTimerEnd({
    required Future<void> Function() nextPage,
    required String question,
    required String correctAnswer
  }){
    if(!canPressed) return;

    results.add(ResultModel(
      question: question,
      correctAnswer: correctAnswer,
      userAnswer: "unknown",
      isCorrect: null,
      totalScore: -1
    ));

    styleList[correctAnswerIndex].backgroundColor = Colors.amber;
    styleList[correctAnswerIndex].borderColor = Colors.black;
    canPressed = false;
    notifyListeners();
    nextPage().then((value) {
      for(int i=0; i<3; i++){
        styleList[i].borderColor = AppColors.primaryGreen;
        styleList[i].backgroundColor = Colors.white;
        styleList[i].textColor = Colors.black;
      }
      canPressed = true;
    });
  }


  /// for result box
  Future<void> submitScore({
    required BuildContext  context,
    required String technologyId,
    required String stage,
  }) async {
    final String uid = (await AppStorage.load(StorageKey.uid))!;
    bool result = await NetworkService.put("$_apiSubmitScore?uid=$uid",
      {
        "technologyId": technologyId,
        "stage": stage,
        "ball": int.parse(calculateTotalScore)
      }
    );

    if(!result && context.mounted){
      SubmitScoreErrorDialog(
        context: context,
        submitScore: () => submitScore(
          context: context,
          technologyId: technologyId,
          stage: stage
        )
      );
    }
  }

  String get calculateTotalScore {
    int totalScore = 0;
    for (ResultModel element in results) {
      totalScore += element.totalScore;
    }
    return totalScore.toString();
  }

  int get calculateCorrectAnswers {
    int count = 0;
    for(ResultModel resultModel in results){
      if(resultModel.isCorrect == true) count++;
    }
    return count;
  }

  int get calculateIncorrectAnswers {
    int count = 0;
    for(ResultModel resultModel in results){
      if(resultModel.isCorrect == false) count++;
    }
    return count;
  }

  int get calculateNoPressedAnswers {
    int count = 0;
    for(ResultModel resultModel in results){
      if(resultModel.isCorrect == null) count++;
    }
    return count;
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
