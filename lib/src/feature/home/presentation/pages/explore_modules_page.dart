import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/modules_model.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../widgets/widget_explore_modules_page_app_bar.dart';
import '../widgets/widget_explore_modules_page_box.dart';

class ExploreModulesPage extends StatefulWidget {
  final String stage;
  final String technologyId;

  const ExploreModulesPage({
    super.key,
    required this.stage,
    required this.technologyId
  });

  @override
  State<ExploreModulesPage> createState() => _ExploreModulesPageState();
}

class _ExploreModulesPageState extends State<ExploreModulesPage> {

  @override
  void initState() {
    super.initState();
    final HomeController homeController = HomeController();
    homeController.exploreModulesInitState(widget.technologyId, widget.stage);
    homeController.currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: !controller.isLoadingForExploreModules ? ExploreModulesPageAppBar(
        text: controller.modulesModel.title,
        imageUrl: controller.modulesModel.imageUrl,
      ) : null,
      body: !controller.isLoadingForExploreModules ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            SizedBox(
              height: 38,
              child: ListView.separated(
                itemCount: controller.modulesModel.modules.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemBuilder: (context, index) => SizedBox(
                  width: 74,
                  child: ElevatedButton(
                    onPressed: () => controller.changeIndex(index),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: index == controller.currentIndex ? AppColors.primaryGreen : AppColors.lF5F5F5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    child: Text(
                      "${index + 1}-module",
                      style: const AppTextStyle().titleLarge?.copyWith(
                        color: index == controller.currentIndex ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            controller.modulesModel.modules.isNotEmpty ? Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 85),
                itemCount: controller.modulesModel.modules[controller.currentIndex].departments.length,
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final Department department = controller.modulesModel.modules[controller.currentIndex].departments[index];
                  return ExploreModulesPageBox(
                    title: controller.modulesModel.title,
                    stage: widget.stage,
                    imageUrl: controller.modulesModel.imageUrl,
                    technologyId: widget.technologyId,
                    department: department,
                    onTap: () => controller.changeDepartmentIsExpanded(department),
                  );
                }
              ),
            ) : const Center(
              child: Text(
                "There are no models",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.grey
                )
              ),
            )
          ],
        ),
      ) : const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
