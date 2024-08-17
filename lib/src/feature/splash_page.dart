import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pdp_quiz_app_with_my_backand/src/core/storage/app_storage.dart";
import "package:pdp_quiz_app_with_my_backand/src/feature/blocked/blocked_page.dart";
import "../core/routes/app_route_name.dart";
import "../core/style/colors.dart";
import "../core/style/images.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    navigation(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: AppImages.logo,
      ),
    );
  }

  Future<void> navigation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if(await AppStorage.load(StorageKey.isActive) == "false" && context.mounted) {
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const BlockedPage()), (route) => true);
    } else if(await AppStorage.load(StorageKey.uid) != null && context.mounted){
      context.go(AppRouteName.home);
    } else if(context.mounted){
      context.go(AppRouteName.login);
    }
  }
}
