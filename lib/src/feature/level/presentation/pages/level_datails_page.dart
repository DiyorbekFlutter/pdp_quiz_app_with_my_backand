import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/level_user_info_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/style/colors.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/style/images.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/level/controller/level_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/level_details_app_bar.dart';

class LevelDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String technologyId;
  final String stage;

  const LevelDetailsPage({
    super.key,
    required this.technologyId,
    required this.stage,
    required this.title,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final LevelController controller = Provider.of<LevelController>(context, listen: false);
    controller.fetchData(context, technologyId, stage);
    return Consumer<LevelController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: !controller.isLoadingLevelDetails ? LevelDetailsAppBar(
            title: title,
            imageUrl: imageUrl,
            isLoading: controller.isLoadingLevelDetails,
          ) : null,
          body: controller.isLoadingLevelDetails ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeCap: StrokeCap.round,
            ),
          ) : ListView.separated(
            padding: const EdgeInsets.only(top: 20, bottom: 90, left: 20, right: 20),
            itemCount: controller.levelUserInfoModels.length,
            separatorBuilder: (context, index) {
              return index == 0 ? const Divider(
                height: 0,
                thickness: 3,
                color: Colors.grey,
              ) : const SizedBox.shrink();
            },
            itemBuilder: (context, index) {
              final LevelUserInfoModel levelUserInfoModel = controller.levelUserInfoModels[0];
              return SizedBox(
                height: 60,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(index==0 ? 10 : 0),
                      bottom: Radius.circular(index == controller.levelUserInfoModels.length - 1 ? 10 : 0)
                    ),
                    color: AppColors.lF5F5F5
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 25,
                        child: Center(
                          child: Text(
                            levelUserInfoModel.position.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      levelUserInfoModel.imageUrl != null ? CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: levelUserInfoModel.imageUrl != null ? NetworkImage(levelUserInfoModel.imageUrl!) : null,
                        child: levelUserInfoModel.imageUrl == null ? AppImages.profile : null
                      ) : AppImages.profilePrimaryGreen,
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          levelUserInfoModel.username,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(levelUserInfoModel.totalScore.toString()),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
