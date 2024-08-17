
import '../network_service.dart';

class ModulesModel {
  final String title;
  final String stage;
  final String imageUrl;
  final List<Module> modules;

  ModulesModel({
    required this.title,
    required this.stage,
    required this.imageUrl,
    required this.modules
  });

  factory ModulesModel.fromJson(Map<String, dynamic> json) => ModulesModel(
    title: json["title"] as String,
    stage: json["stage"] as String,
    imageUrl: (json["imageUrl"] as String).replaceAll("localhost", NetworkService.wifiApi),
    modules: List<Module>.from(json["modules"].map((e) => Module.fromJson(e)))
  );

  Map<String, dynamic> get toJson => {
    "title": title,
    "stage": stage,
    "imageUrl": imageUrl,
    "modules": modules.map((e) => e.toJson).toList()
  };
}

class Module {
  final String id;
  final String technologyId;
  final String title;
  final String stage;
  final List<Department> departments;

  const Module({
    required this.id,
    required this.technologyId,
    required this.title,
    required this.stage,
    required this.departments
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    id: json["id"] as String,
    technologyId: json["technologyId"] as String,
    title: json["title"] as String,
    stage: json["stage"] as String,
    departments: List<Department>.from(json["departments"].map((e) => Department.fromJson(e))),
  );

  Map<String, dynamic> get toJson => {
    "id": id,
    "technologyId": technologyId,
    "title": title,
    "stage": stage,
    "departments": departments.map(((e) => e.toJson)).toList()
  };
}

class Department {
  final String id;
  final String moduleId;
  final String title;
  final List<Question> questions;
  bool isExpanded = false;

  Department({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.questions,
    required this.isExpanded
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"] as String,
    moduleId: json["moduleId"] as String,
    title: json["title"] as String,
    questions: List<Question>.from(json["questions"].map((e) => Question.fromJson(e))),
    isExpanded: false
  );

  Map<String, dynamic> get toJson => {
    "id": id,
    "moduleId": moduleId,
    "title": title,
    "questions": questions.map((e) => e.toJson).toList()
  };
}

class Question {
  final String id;
  final String departmentId;
  final String question;
  final String answer;
  final String option1;
  final String option2;
  final String option3;

  const Question({
    required this.id,
    required this.departmentId,
    required this.question,
    required this.answer,
    required this.option1,
    required this.option2,
    required this.option3
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"] as String,
    departmentId: json["departmentId"] as String,
    question: json["question"] as String,
    answer: json["answer"] as String,
    option1: json["option1"] as String,
    option2: json["option2"] as String,
    option3: json["option3"] as String
  );

  Map<String, dynamic> get toJson => {
    "id": id,
    "departmentId": departmentId,
    "question": question,
    "answer": answer,
    "option1": option1,
    "option2": option2,
    "option3": option3
  };

  Question get shuffle {
    List<String> questionsList = [option1, option2, option3];
    questionsList.shuffle();
    return Question(
      id: id,
      departmentId: departmentId,
      question: question,
      answer: answer,
      option1: questionsList[0],
      option2: questionsList[1],
      option3: questionsList[2]
    );
  }
}
