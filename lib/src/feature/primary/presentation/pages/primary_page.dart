import 'package:d_navigation_bar/d_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/primary/controller/primary_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/images.dart';
import '../widgets/buttom_navigation_bar_background.dart';

class PrimaryPage extends StatelessWidget {
  final Widget child;
  const PrimaryPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          child,
          Consumer<PrimaryController>(
            builder: (context, ref, child) => Visibility(
              visible: ref.isActiveAccount,
              child: BottomNavigationBarBackground(
                child: DNavigationBar(
                  onChanged: (index) {
                    context.go(
                        index == 0
                            ? AppRouteName.home
                            : index == 1
                            ? AppRouteName.level
                            : AppRouteName.profile
                    );
                  },
                  backgroundColor: Colors.transparent,
                  useShadow: false,
                  items: [
                    DNavigationBarItem(icon: AppImages.home, activeIcon: AppImages.homePrimaryGreen),
                    DNavigationBarItem(icon: AppImages.level, activeIcon: AppImages.levelPrimaryGreen),
                    DNavigationBarItem(icon: AppImages.profile, activeIcon: AppImages.profilePrimaryGreen)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
