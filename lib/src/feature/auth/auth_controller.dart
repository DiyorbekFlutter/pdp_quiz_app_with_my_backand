import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/routes/app_route_name.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/storage/app_storage.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_snacbar.dart';

import '../../core/network_service.dart';


class AuthController with ChangeNotifier {
  // api
  final String _apiLogin = "/api/v1/auth/login";
  final String _apiRegister = "/api/v1/auth/register";

  // common
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void emailTextFieldOnChanged(_) {
    if(_.endsWith("@gmail.com")) {
      passwordFocusNodeLogin.requestFocus();
    }
  }

  String? emailValidator(_) {
    if(_ == null || _.isEmpty) return "voy emailingizni yozmadingizku!!!";
    if(!_.endsWith("@gmail.com")) return "noto'g'ri format";
    return null;
  }

  String? passwordValidator(_) {
    if(_ == null || _.isEmpty) return "voy password yozmadingizku!!!";
    if(_.length < 6) return "eng kamida 6 ta belgi bo'lishi kerak";
    return null;
  }

  // login
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final FocusNode emailFocusNodeLogin = FocusNode();
  final FocusNode passwordFocusNodeLogin = FocusNode();
  bool isLoadingLogin = false;

  void login(BuildContext context) async {
    if(isLoadingLogin) return;
    if(!formKeyLogin.currentState!.validate()) return;

    isLoadingLogin = true;
    notifyListeners();

    (String?, int) result = await NetworkService.post(_apiLogin, {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim()
    });

    isLoadingLogin = false;
    notifyListeners();

    if(!context.mounted){
      return;
    } else if(result.$1 != null){
      await AppStorage.store(
        key: StorageKey.uid,
        value: jsonDecode(result.$1!)["uid"] as String
      );
      if(context.mounted) context.go(AppRouteName.home);
    } else {
      CommonSnackBar(
        context: context,
        contentText: result.$2 == 404
            ? "Bunday foydalanuvchi topilmadi! Iltimos avval royhatdan o'ting."
            : result.$2 == 401
            ? "Parolni noto'g'ri yozdingiz"
            : result.$2 == 500
            ? "Server ishlamayapti. Keyinroq unirib ko'ring"
            : "Nomalum xatolik"
      );
    }
  }


  // register
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final FocusNode emailFocusNodeRegister = FocusNode();
  final FocusNode passwordFocusNodeRegister = FocusNode();
  bool isLoadingRegister = false;
  bool isPrivacyPolicyChecked = false;
  bool isChecking = false;

  void register(BuildContext context) async {
    if(isLoadingRegister) return;
    if(!formKeyRegister.currentState!.validate()) return;
    if(!isPrivacyPolicyChecked){
      isChecking = true;
      notifyListeners();
      return;
    }

    isLoadingRegister = true;
    notifyListeners();

    (String?, int) result = await NetworkService.post(_apiRegister, {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "firstname": firstNameController.text.trim(),
      "lastname": lastNameController.text.trim()
    });

    isLoadingRegister = false;
    notifyListeners();

    if(!context.mounted){
      return;
    } else if(result.$1 != null){
      await AppStorage.store(
        key: StorageKey.uid,
        value: jsonDecode(result.$1!)["uid"] as String
      );
      if(context.mounted) context.go(AppRouteName.home);
    } else {
      CommonSnackBar(
        context: context,
        contentText: result.$2 == 409
            ? "Ushbu email avval ro'yhatdan o'tgan!"
            : result.$2 == 500
            ? "Server ishlamayapti. Keyinroq unirib ko'ring"
            : "Nomalum xatolik"
      );
    }
  }

  String? firstnameValidator(_){
    if(_ == null || _.isEmpty) return "Majburiy maydon";
    if(_.length < 3) return "Kamida 3 ta belgi bo'lishi kerak";
    return null;
  }

  String? lastnameValidator(_){
    if(_ == null || _.isEmpty) return null;
    if(_.length < 3) return "Kamida 3 ta belgi bo'lishi kerak (optional)";
    return null;
  }

  void checkIsPrivacyPolicyChecked(_){
    isPrivacyPolicyChecked = !isPrivacyPolicyChecked;
    notifyListeners();
  }


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }
}
