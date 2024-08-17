import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/level_user_info_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_snacbar.dart';

import '../../../core/network_service.dart';
import '../../../core/models/technologies_model.dart';
import '../../../core/storage/app_storage.dart';

class LevelController with ChangeNotifier {
  final String _apiTechnologies = "/api/v1/home-technologies";
  final String _apiLevelDetailsInfo = "/api/v1/level-leaderboard";

  /// for level page
  bool isLoading = true;
  int? expandedIndex;
  TechnologiesModel technologiesModel = const TechnologiesModel(
    userName: "unknown",
    userProfileImageUrl: null,
    technologies: []
  );

  Future<void> initState() async {
    if(technologiesModel.userName == "unknown"){
      final String uid = (await AppStorage.load(StorageKey.uid))!;
      final String? result = await NetworkService.get("$_apiTechnologies?uid=$uid");

      if(result != null){
        technologiesModel = TechnologiesModel.fromJson(jsonDecode(result))..technologies;
        isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> refresh() async {
    expandedIndex = null;
    isLoading = true;
    notifyListeners();

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiTechnologies?uid=$uid");

    if(result != null){
      technologiesModel = TechnologiesModel.fromJson(jsonDecode(result))..technologies;
      isLoading = false;
      notifyListeners();
    }
  }

  void itemOnTap(int index){
    if(expandedIndex == index){
      expandedIndex = null;
    } else {
      expandedIndex = index;
    }
    notifyListeners();
  }

  /// for level details page
  bool isLoadingLevelDetails = false;
  List<LevelUserInfoModel> levelUserInfoModels = [];

  Future<void> fetchData(BuildContext context, String technologyId, String stage) async {
    isLoadingLevelDetails = true;
    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiLevelDetailsInfo?uid=$uid&technologyId=$technologyId&stage=$stage");

    if(result != null){
      levelUserInfoModels = List<LevelUserInfoModel>.from(jsonDecode(result).map((e) => LevelUserInfoModel.fromJson(e)));
      isLoadingLevelDetails = false;
      notifyListeners();
    } else if(context.mounted) {
      CommonSnackBar(
        context: context,
        contentText: "Error: Malumotlarni olibda xatolik yuz berdi"
      );
    }
  }
}
