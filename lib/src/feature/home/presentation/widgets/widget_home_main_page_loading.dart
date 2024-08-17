import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeMainPageLoading extends StatelessWidget {
  const HomeMainPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 90),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 30,
        mainAxisExtent: 160
      ),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.white,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
