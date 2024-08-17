import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LevelLoading extends StatelessWidget {
  const LevelLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.white,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 15, bottom: 90, left: 20, right: 20),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => SizedBox(
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
