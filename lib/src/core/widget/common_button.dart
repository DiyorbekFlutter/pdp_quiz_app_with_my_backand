import 'package:flutter/material.dart';

import '../style/colors.dart';

class CommonButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color? color;
  final double? height;
  final double? borderRadius;
  final bool? isLoading;
  final Color? progressIndicatorColor;
  final BorderSide? side;
  final TextStyle? textStyle;

  const CommonButton({
    required this.onPressed,
    required this.text,
    this.color,
    this.height,
    this.borderRadius,
    this.isLoading,
    this.progressIndicatorColor,
    this.side,
    this.textStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryGreen,
          shape: RoundedRectangleBorder(
            side: side ?? BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 12)
          )
        ),
        child: !(isLoading ?? false) ? Text(text,
          style: textStyle ?? const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ) : CircularProgressIndicator(
          color: progressIndicatorColor ?? Colors.white,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
