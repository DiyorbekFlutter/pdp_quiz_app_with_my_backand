import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/network_service.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/profile_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_snacbar.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/home_controller.dart';

import '../../../core/storage/app_storage.dart';
import '../presentation/widgets/delete_profile_image_dialog.dart';

class ProfileController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  ProfileModel? profileModel;

  final String _apiProfileInfo = "/api/v1/profile-get-info";
  final String _apiChangeProfileInfo = "/api/v1/profile-change-info";
  final String _apiChangeProfileImage = "/api/v1/profile-change-image";
  final String _apiDeleteProfileImage = "/api/v1/profile-delete-image";

  bool isLoading = true;
  bool isLoadingProfileImage = false;

  Future<void> fetchData() async {
    if(profileModel != null)  return;
    isLoading = true;
    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiProfileInfo?uid=$uid");

    if(result !=  null){
      profileModel = ProfileModel.fromJson(jsonDecode(result));
      isLoading = false;
      emailController.text = profileModel!.email;
      firstNameController.text = profileModel!.firstname;
      lastNameController.text = profileModel!.lastname ?? "";
      notifyListeners();
    }
  }

  Future<void> pickAndUploadImage(BuildContext context) async {
    final FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(type: FileType.image);

    if(filePickerResult != null){
      final String uid = (await AppStorage.load(StorageKey.uid))!;
      final PlatformFile platformFile = filePickerResult.files.first;
      final File file = File(platformFile.path!);
      final Uint8List imageBytes = file.readAsBytesSync();

      bool result = await NetworkService.put(
        "$_apiChangeProfileImage?uid=$uid",
        {"imageBytes": imageBytes}
      );

      if(result){
        refreshImage();
      } else if(context.mounted) {
        CommonSnackBar(
          context: context,
          contentText: "Error: Rasm o'zgartirilmadi"
        );
      }
    }
  }

  Future<void> deleteProfilerImage(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 150));
    if(context.mounted) {
      DeleteDialog(
        context: context,
        imageUrl: profileModel!.profileImageUrl!,
        delete: ()  async {
          final String uid = (await AppStorage.load(StorageKey.uid))!;
          bool result = await NetworkService.delete("$_apiDeleteProfileImage?uid=$uid");

          if(result){
            refreshImage();
          } else if(context.mounted) {
            CommonSnackBar(
              context: context,
              contentText: "Error: Rasm o'chirilmadi"
            );
          }
        }
      );
    }
  }

  Future<void> saveChanges(BuildContext context) async {
    if(firstNameController.text.trim().length < 2){
      CommonSnackBar(
        context: context,
        contentText: "Ism kamida 2 ta belgidan iborat bo'lishi kerak"
      );
      return;
    } else if(lastNameController.text.trim().length == 1){
      CommonSnackBar(
        context: context,
        contentText: "Familiya 1 ta belgidan iborat bo'la olmaydi."
      );
      return;
    } else if(firstNameController.text.trim() == profileModel!.firstname.trim() && lastNameController.text.trim() == profileModel!.lastname?.trim()){
      CommonSnackBar(
        context: context,
        contentText: "O'zgartirish aniqlanmadi."
      );
      return;
    }

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    bool result = await NetworkService.put("$_apiChangeProfileInfo?uid=$uid", {
      "firstname": firstNameController.text.trim(),
      "lastname": lastNameController.text.trim().isNotEmpty ? lastNameController.text.trim() : null
    });

    if(result && context.mounted){
      CommonSnackBar(
        context: context,
        contentText: "O'zgarishlar saqlandi"
      );

      refreshProfile();
    } else if(context.mounted) {
      CommonSnackBar(
        context: context,
        contentText: "Error: O'zgarishlar saqlanmadi qaytadan unirib ko'ring!"
      );
    }
  }

  Future<void> refreshImage() async {
    isLoadingProfileImage = true;
    notifyListeners();

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiProfileInfo?uid=$uid");
    if(result !=  null) profileModel = ProfileModel.fromJson(jsonDecode(result));
    isLoadingProfileImage = false;
    notifyListeners();
    HomeController().refresh();
  }

  Future<void> refreshProfile() async {
    isLoading = true;
    notifyListeners();

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final String? result = await NetworkService.get("$_apiProfileInfo?uid=$uid");
    if(result !=  null) profileModel = ProfileModel.fromJson(jsonDecode(result));
    isLoading = false;
    notifyListeners();
    if(firstNameController.text.trim() != profileModel!.firstname.trim()) HomeController().refresh();
  }

  Future<void> logout() async {}


  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
