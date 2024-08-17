import "package:flutter/foundation.dart";

@immutable
final class AppRouteName {
  const AppRouteName._();

  static const String splashPage = "/";

  // auth
  static const String register = "/register";
  static const String login = "/login";

  // home
  static const String home = "/home";
  static const String selectDifficultyPage = "selectDifficultyPage";
  static const String exploreModulesPage = "exploreModulesPage";
  static const String testPage = "testPage";

  // level
  static const String level = "/level";
  static const String levelDetails = "levelDetails";

  // profile
  static const String profile = "/profile";

  // chat page
  static const String chatPage = "/chatPage";
}
