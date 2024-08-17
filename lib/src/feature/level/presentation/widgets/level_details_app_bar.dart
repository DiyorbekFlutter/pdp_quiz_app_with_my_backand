import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/style/text_style.dart';

class LevelDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLoading;
  final String title;
  final String imageUrl;

  const LevelDetailsAppBar({
    super.key,
    this.isLoading = false,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_sharp),
              const SizedBox(width: 5),
              const Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const Spacer(),
              !isLoading ? Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const AppTextStyle().homeTextStyle?.copyWith(
                    fontSize: FontSize.size20
                  ),
                ),
              ) : Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.8),
                highlightColor: Colors.white,
                child: SizedBox(
                  width: 200,
                  height: 35,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              !isLoading ? SizedBox(
                width: 40,
                height: 40,
                child: Image.network(imageUrl),
              ) : Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.8),
                highlightColor: Colors.white,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
