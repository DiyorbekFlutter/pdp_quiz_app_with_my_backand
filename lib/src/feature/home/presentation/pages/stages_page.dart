import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/utils/extensions.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../../../core/widget/common_button.dart';
import '../widgets/widget_home_details_app_bar.dart';

class StagesPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String technologyId;

  const StagesPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.technologyId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeDetailsAppBar(
        title: title,
        imageUrl: imageUrl,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            height: 162,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  "Welcome to I.Q",
                  style: const AppTextStyle().profileTitleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet velit malesuada, scelerisque diam non, blandit neque.",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: const AppTextStyle().profileTitleLarge?.copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 57),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85),
            child: Text(
              "Choose one of the steps...",
              style: const AppTextStyle().homeTextStyle?.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                CommonButton(
                  text: "Easy",
                  onPressed: () => context.push(
                    AppRouteName.home
                        .childRoute(AppRouteName.selectDifficultyPage)
                        .childRoute(AppRouteName.exploreModulesPage),
                    extra: {
                      "stage": "easy",
                      "technologyId": technologyId
                    }
                  ),
                ),
                const SizedBox(height: 20),
                CommonButton(
                  text: "Medium",
                  onPressed: () => context.push(
                    AppRouteName.home
                        .childRoute(AppRouteName.selectDifficultyPage)
                        .childRoute(AppRouteName.exploreModulesPage),
                    extra: {
                      "stage": "medium",
                      "technologyId": technologyId
                    }
                  ),
                ),
                const SizedBox(height: 20),
                CommonButton(
                  text: "Hard",
                  onPressed: () => context.push(
                    AppRouteName.home
                        .childRoute(AppRouteName.selectDifficultyPage)
                        .childRoute(AppRouteName.exploreModulesPage),
                    extra: {
                      "stage": "hard",
                      "technologyId": technologyId
                    }
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
