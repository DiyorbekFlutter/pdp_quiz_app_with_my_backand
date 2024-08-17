import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../style/images.dart';
import '../style/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLoading;
  final String title;
  final String? imageUrl;

  const CommonAppBar({
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !isLoading ? Expanded(
                child: Text(
                  title,
                  maxLines: 1,
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
              !isLoading ? CircleAvatar(
                radius: 23,
                backgroundColor: Colors.transparent,
                backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
                child: imageUrl == null ? AppImages.profile : null
              ) : Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.8),
                highlightColor: Colors.white,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle
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
  Size get preferredSize => const Size.fromHeight(80);
}
