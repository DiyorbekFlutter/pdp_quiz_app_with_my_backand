import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/technologies_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/common_app_bar.dart';
import '../widgets/widget_home_main_page_box.dart';
import '../widgets/widget_home_main_page_loading.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Provider.of<HomeController>(context)..initState(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        isLoading: controller.isLoadingForMainPage,
        title: "Hello ${controller.technologiesModel.userName}",
        imageUrl: controller.technologiesModel.userProfileImageUrl,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        color: Colors.black,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: !controller.isLoadingForMainPage ? GridView.builder(
            itemCount: controller.technologiesModel.technologies.length,
            padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 90),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 30,
              mainAxisExtent: 160
            ),
            itemBuilder: (context, index) {
              final Technology technology = controller.technologiesModel.technologies[index];
              return HomeMainPageBox(
                text: technology.title,
                imageUrl: technology.imageUrl,
                technologyId: technology.id,
              );
            },
          ) : const HomeMainPageLoading(),
        ),
      ),
    );
  }
}
