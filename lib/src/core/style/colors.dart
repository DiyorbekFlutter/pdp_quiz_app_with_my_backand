import "package:flutter/material.dart";

@immutable
sealed class AppColors {
  //main colors
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color primaryGreen = Color(0xff00B533);
  static const Color primaryBlue = Color(0xff00B4FF);

  //every colors
  static const Color l00B533 = Color(0xff00B533);
  static const Color l121212 = Color(0xff121212);
  static const Color lC1C1C1 = Color(0xffC1C1C1);
  static const Color lD9D9D9 = Color(0xffD9D9D9);
  static const Color l264653 = Color(0xff264653);
  static const Color lF5F5F5 = Color(0xffF5F5F5);
  static const Color lFF0000 = Color(0xffFF0000);
  static const Color white30 = Colors.white30;
  static const Color white50 = Colors.white54;

  // gradients
  static const List<Color> homeMainScrollItems = <Color>[white, black];
}
