class ResultModel {
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final bool? isCorrect;
  final int totalScore;

  const ResultModel({
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.isCorrect,
    required this.totalScore
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    question: json["question"] as String,
    correctAnswer: json["correctAnswer"] as String,
    userAnswer: json["userAnswer"] as String,
    isCorrect: json["isCorrect"] as bool?,
    totalScore: json["totalScore"] as int
  );

  Map<String, dynamic> get toJson => {
    "question": question,
    "correctAnswer": correctAnswer,
    "userAnswer": userAnswer,
    "isCorrect": isCorrect,
    "totalScore": totalScore
  };
}
