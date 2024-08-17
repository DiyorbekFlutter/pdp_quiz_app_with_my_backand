import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class ExploreModulesPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String imageUrl;

  const ExploreModulesPageAppBar({
    super.key,
    required this.text,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(180),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              InkWell(
                onTap: () => context.pop(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_back_sharp),
                    const SizedBox(width: 5),
                    Text(
                      "Back",
                      style: const AppTextStyle().profileTitleLarge?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(imageUrl, width: 115, height: 115),
                  const SizedBox(height: 10),
                  Text(text,
                    style: const AppTextStyle().homeTextStyle?.copyWith(
                      fontSize: FontSize.size20
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180);
}

