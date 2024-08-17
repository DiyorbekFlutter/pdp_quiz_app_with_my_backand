import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widget/common_button.dart';

class ResultPageButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const ResultPageButton({
    required this.text,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: onPressed,
      text: text,
      color: Colors.white,
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
      side: const BorderSide(color: AppColors.primaryGreen),
    );
  }
}
