// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'colors.dart';

@immutable
final class AppTextStyle extends TextTheme {
  const AppTextStyle();

  /// Diyorbek: Men qo'shdim
  TextStyle? get homeTextStyle => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size15,
    fontFamily: "Poppins",
    color: AppColors.black,
  );

  /// eng yaqin songa qarab olinadi:
  @override
  TextStyle? get profileTitleLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get profileTitleMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.black,
      );

  @override
  TextStyle? get onlineRecordTitleMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get onlineRecordTitleLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get profileLabelMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get titleSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get titleMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get titleLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get labelLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get labelMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get labelSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline1 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
        letterSpacing: 0.1,
      );

  @override
  TextStyle? get headline2 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline3 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline4 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline5 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get loginTitleSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size20,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get loginTitleLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get registerLabelLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get loginLabelMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  @override
  TextStyle? get loginLabelSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get registerBodyMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get loginBodyLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get loginBodySmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headlineLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline6 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline7 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size20,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline8 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline9 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get displaySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get displayMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get displayLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size12,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );

  @override
  TextStyle? get headline10 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: 'Poppins',
        color: AppColors.white,
      );
}

@immutable
final class FontSize {
  const FontSize._();

  static double size24 = 24;
  static double size32 = 32;
  static double size22 = 22;
  static double size20 = 20;
  static double size18 = 18;
  static double size12 = 12;
  static double size11 = 11;
  static double size8 = 8;
  static double size14 = 14;
  static double size15 = 15;
  static double size16 = 16;
  static double size10 = 10;

  static double size13 = 13;
}
