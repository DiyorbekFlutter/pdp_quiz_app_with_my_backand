import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/routes/app_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/auth/auth_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/blocked/blocked_page_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/home_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/test_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/level/controller/level_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/primary/controller/primary_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/profile/controller/chat_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/profile/controller/profile_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/setting/inherited_status_notifier.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/setting/status_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrimaryController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => TestController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => LevelController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => BlockedPageController()),
      ],
      child: InheritedStatusNotifier(
        controller: statusController,
        child: Builder(
          builder: (context) {
            log("Material app builder");
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: "PDP Quiz App",
              routerConfig: AppRouter.router,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                textTheme: GoogleFonts.poppinsTextTheme(),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
                textSelectionTheme: const TextSelectionThemeData(
                  selectionColor: Colors.blue,
                  selectionHandleColor: Colors.blue
                )
              ),
            );
          }
        ),
      ),
    );
  }
}
