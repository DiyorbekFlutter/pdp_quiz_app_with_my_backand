import 'package:flutter/material.dart';
import '../../../../core/style/text_style.dart';

class HomeDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String imageUrl;

  const HomeDetailsAppBar({
    super.key,
    required this.title,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const AppTextStyle().profileTitleMedium
            ),
          ),
          const SizedBox(width: 10),
          Image.network(imageUrl, width: 30, height: 30)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
