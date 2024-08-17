import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "colors.dart";

@immutable
sealed class AppImages {
  const AppImages._();

  ///  SVG
  static final SvgPicture logo = SvgPicture.asset("assets/icons/ic_logo.svg");

  static final SvgPicture home = SvgPicture.asset(
    height: 35,
    width: 35,
    "assets/icons/home.svg"
  );

  static final SvgPicture homePrimaryGreen = SvgPicture.asset(
    height: 35,
    width: 35,
    // ignore: deprecated_member_use
    color: AppColors.primaryGreen,
    "assets/icons/home.svg"
  );

  static final SvgPicture level = SvgPicture.asset(
    height: 35,
    width: 35,
    "assets/icons/level.svg"
  );

  static final SvgPicture levelPrimaryGreen = SvgPicture.asset(
    height: 35,
    width: 35,
    // ignore: deprecated_member_use
    color: AppColors.primaryGreen,
    "assets/icons/level.svg"
  );

  static final SvgPicture profile = SvgPicture.asset(
    height: 35,
    width: 35,
    "assets/icons/profile.svg"
  );

  static final SvgPicture profilePrimaryGreen = SvgPicture.asset(
    height: 35,
    width: 35,
    // ignore: deprecated_member_use
    color: AppColors.primaryGreen,
    "assets/icons/profile.svg"
  );

  static final SvgPicture categoryArrowBackIcon = SvgPicture.asset(
    "assets/icons/ic_arrow_back.svg",
    height: 24,
    width: 24,
    fit: BoxFit.cover,
  );



  /// PNG



  static final Image panPersonalData = Image.asset(
    "assets/images/personal_data_pan.png",
    height: 28,
    width: 28,
    fit: BoxFit.fitHeight,
  );
}


extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
