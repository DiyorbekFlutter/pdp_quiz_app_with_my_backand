import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/utils/extensions.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class HomeMainPageBox extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String technologyId;

  const HomeMainPageBox({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.technologyId
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        AppRouteName.home.childRoute(AppRouteName.selectDifficultyPage),
        extra: {
          "title": text,
          "imageUrl": imageUrl,
          "technologyId": technologyId
        }
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.lF5F5F5,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 33),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(text, style: const AppTextStyle().homeTextStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}