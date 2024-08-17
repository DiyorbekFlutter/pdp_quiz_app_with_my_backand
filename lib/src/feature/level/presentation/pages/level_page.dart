import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/technologies_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/routes/app_route_name.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/utils/extensions.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/widget/common_app_bar.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/level/controller/level_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/level/presentation/widgets/level_loading.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../core/style/colors.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LevelController controller = Provider.of<LevelController>(context)..initState();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: controller.technologiesModel.userName,
        imageUrl: controller.technologiesModel.userProfileImageUrl,
        isLoading: controller.isLoading,
      ),
      body: controller.isLoading ? const LevelLoading() : RefreshIndicator(
        onRefresh: controller.refresh,
        color: Colors.black,
        backgroundColor: Colors.white,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 15, bottom: 90, left: 20, right: 20),
          itemCount: controller.technologiesModel.technologies.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final Technology technology = controller.technologiesModel.technologies[index];
            return Column(
              children: [
                SizedBox(
                  height: 60,
                  child: ZoomTapAnimation(
                    onTap: () => controller.itemOnTap(index),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.lF5F5F5,
                        borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(15),
                          topLeft: const Radius.circular(15),
                          bottomRight: index == controller.expandedIndex ? Radius.zero : const Radius.circular(15),
                          bottomLeft: index == controller.expandedIndex ? Radius.zero : const Radius.circular(15)
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Image.network(technology.imageUrl),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                technology.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Transform.rotate(
                              angle: index == controller.expandedIndex ? (90 * (3.1415926535897932 / 180)) : 0,
                              child: const Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if(controller.expandedIndex == index)
                SizedBox(
                  height: 60,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.lF5F5F5,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.zero,
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => context.push(
                                AppRouteName.level.childRoute(AppRouteName.levelDetails),
                                extra: {
                                  "title": technology.title,
                                  "imageUrl": technology.imageUrl,
                                  "stage": "easy",
                                  "technologyId": technology.id
                                }
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.blue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(15))
                                )
                              ),
                              child: const Text("Easy", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => context.push(
                                AppRouteName.level.childRoute(AppRouteName.levelDetails),
                                extra: {
                                  "title": technology.title,
                                  "imageUrl": technology.imageUrl,
                                  "stage": "medium",
                                  "technologyId": technology.id
                                }
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.blue,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                              ),
                              child: const Text("Medium", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => context.push(
                                AppRouteName.level.childRoute(AppRouteName.levelDetails),
                                extra: {
                                  "title": technology.title,
                                  "imageUrl": technology.imageUrl,
                                  "stage": "hard",
                                  "technologyId": technology.id
                                }
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.blue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(right: Radius.circular(15))
                                )
                              ),
                              child: const Text("Hard", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
