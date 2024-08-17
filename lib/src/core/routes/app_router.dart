import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pdp_quiz_app_with_my_backand/src/core/models/modules_model.dart";
import "package:pdp_quiz_app_with_my_backand/src/feature/auth/login.dart";
import "package:pdp_quiz_app_with_my_backand/src/feature/auth/register.dart";
import "package:pdp_quiz_app_with_my_backand/src/feature/level/presentation/pages/level_datails_page.dart";
import "../../feature/home/presentation/pages/explore_modules_page.dart";
import "../../feature/home/presentation/pages/home_main_page.dart";
import "../../feature/home/presentation/pages/stages_page.dart";
import "../../feature/home/presentation/pages/test_page.dart";
import "../../feature/level/presentation/pages/level_page.dart";
import "../../feature/primary/presentation/pages/primary_page.dart";
import "../../feature/profile/presentation/pages/chat_page.dart";
import "../../feature/profile/presentation/pages/profile_page.dart";
import "../../feature/splash_page.dart";
import "app_route_name.dart";

final class AppRouter{
  static GoRouter router = GoRouter(
      initialLocation: AppRouteName.splashPage,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) => PrimaryPage(child),
          routes: [
            GoRoute(
              path: AppRouteName.home,
              builder: (BuildContext context, GoRouterState state) => const HomeMainPage(),
              routes: [
                GoRoute(
                  path: AppRouteName.selectDifficultyPage,
                  builder: (BuildContext context, GoRouterState state) {
                    Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                    return StagesPage(
                      title: data["title"] as String,
                      imageUrl: data["imageUrl"] as String,
                      technologyId: data["technologyId"] as String,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: AppRouteName.exploreModulesPage,
                      builder: (BuildContext context, GoRouterState state) {
                        Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                        return ExploreModulesPage(
                          stage: data["stage"] as String,
                          technologyId: data["technologyId"] as String,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: AppRouteName.testPage,
                          builder: (BuildContext context, GoRouterState state) {
                            Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                            return TestPage(
                              department: data["department"] as Department,
                              technologyId: data["technologyId"] as String,
                              title: data["title"] as String,
                              stage: data["stage"] as String,
                              imageUrl: data["imageUrl"] as String
                            );
                          },
                        ),
                      ]
                    ),
                  ]
                ),
              ]
            ),
            GoRoute(
              path: AppRouteName.level,
              builder: (BuildContext context, GoRouterState state) => const LevelPage(),
              routes: [
                GoRoute(
                  path: AppRouteName.levelDetails,
                  builder: (BuildContext context, GoRouterState state) {
                    final Map<String, String> json = state.extra as Map<String, String>;
                    return LevelDetailsPage(
                      title: json["title"]!,
                      imageUrl: json["imageUrl"]!,
                      technologyId: json["technologyId"]!,
                      stage: json["stage"]!
                    );
                  },
                ),
              ]
            ),
            GoRoute(
              path: AppRouteName.profile,
              builder: (context, state) => const ProfilePage(),
            ),
          ]
        ),

        GoRoute(
          path: AppRouteName.chatPage,
          builder: (context, state) => ChatPage(state.extra as String),
        ),
        GoRoute(
          path: AppRouteName.splashPage,
          builder: (BuildContext context, GoRouterState state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRouteName.login,
          builder: (BuildContext context, GoRouterState state) => const Login(),
        ),
        GoRoute(
          path: AppRouteName.register,
          builder: (BuildContext context, GoRouterState state) => const Register(),
        ),
      ]
  );
}