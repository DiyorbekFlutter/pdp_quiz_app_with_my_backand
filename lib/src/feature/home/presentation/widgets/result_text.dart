import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class ResultText extends StatelessWidget {
  final String text;
  final Color color;
  const ResultText(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 40),
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
        const SizedBox(width: 5),
        Text(text,
            style: const AppTextStyle().displayMedium?.copyWith(
                fontSize: FontSize.size13,
                color: AppColors.black
            )
        )
      ],
    );
  }
}