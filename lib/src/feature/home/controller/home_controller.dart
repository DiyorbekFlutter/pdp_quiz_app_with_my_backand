import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/network_service.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/modules_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/technologies_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/storage/app_storage.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/web_socket/web_socket_controller.dart';

class HomeController with ChangeNotifier {
  static final HomeController _singleton = HomeController._internal();
  factory HomeController() => _singleton;
  HomeController._internal();

  /// api
  final String _apiTechnologies = "/api/v1/home-technologies";
  final String _apiModules = "/api/v1/home-modules";


  /// home main
  bool isLoadingForMainPage = true;
  TechnologiesModel technologiesModel = const TechnologiesModel(
    userName: "unknown",
    userProfileImageUrl: null,
    technologies: []
  );

  Future<void> initState(BuildContext context) async {
    if(technologiesModel.userName == "unknown"){
      final String uid = (await AppStorage.load(StorageKey.uid))!;
      final String? result = await NetworkService.get("$_apiTechnologies?uid=$uid");

      if(result != null && context.mounted){
        technologiesModel = TechnologiesModel.fromJson(jsonDecode(result))..technologies;
        isLoadingForMainPage = false;
        notifyListeners();
        log((await WebSocketController.connectWebSocket(context)).toString());
      }
    }
  }

  Future<void> refresh() async {
    isLoadingForMainPage = true;
    notifyListeners();

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiTechnologies?uid=$uid");

    if(result != null){
      technologiesModel = TechnologiesModel.fromJson(jsonDecode(result))..technologies;
      isLoadingForMainPage = false;
      notifyListeners();
    }
  }


  /// explore modules page
  bool isLoadingForExploreModules = true;
  int currentIndex = 0;
  late ModulesModel modulesModel;

  Future<void> exploreModulesInitState(String technologyId, String stage) async {
    isLoadingForExploreModules = true;
    final String? result = await NetworkService.get("$_apiModules?technologyId=$technologyId&stage=$stage");

    if(result != null){
      modulesModel = ModulesModel.fromJson(jsonDecode(result));
      isLoadingForExploreModules = false;
      notifyListeners();
    }
  }

  void changeIndex(int index){
    for(Department i in modulesModel.modules[currentIndex].departments){
      i.isExpanded = false;
    }
    currentIndex = index;
    notifyListeners();
  }

  void changeDepartmentIsExpanded(Department department){
    for(Department i in modulesModel.modules[currentIndex].departments){
      i.isExpanded = false;
    }

    department.isExpanded = !department.isExpanded;
    notifyListeners();
  }
}
