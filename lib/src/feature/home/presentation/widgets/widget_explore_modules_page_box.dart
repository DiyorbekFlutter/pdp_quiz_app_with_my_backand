import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/modules_model.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/utils/extensions.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class ExploreModulesPageBox extends StatefulWidget {
  final String title;
  final String stage;
  final String imageUrl;
  final String technologyId;
  final Department department;
  final void Function() onTap;

  const ExploreModulesPageBox({
    required this.title,
    required this.stage,
    required this.imageUrl,
    required this.technologyId,
    required this.department,
    required this.onTap,
    super.key
  });

  @override
  State<ExploreModulesPageBox> createState() => _ExploreModulesPageBoxState();
}

class _ExploreModulesPageBoxState extends State<ExploreModulesPageBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: widget.onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lF5F5F5,
              borderRadius: !widget.department.isExpanded
                  ? BorderRadius.circular(10)
                  : const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.department.title,
                        style: const AppTextStyle().labelSmall?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: widget.department.isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        widget.department.isExpanded? Icons.close : Icons.add,
                        color: widget.department.isExpanded ? Colors.red : null
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: widget.department.isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: widget.department.isExpanded ? SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.lF5F5F5,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(widget.department.questions.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "${index + 1}. ${widget.department.questions[index].question}",
                            style: const TextStyle(color: Colors.black)
                          ),
                        );
                      }),
                      Align(
                        alignment: const Alignment(0.8, 0),
                        child: SizedBox(
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () => context.push(
                              AppRouteName.home
                                  .childRoute(AppRouteName.selectDifficultyPage)
                                  .childRoute(AppRouteName.exploreModulesPage)
                                  .childRoute(AppRouteName.testPage),
                              extra: {
                                "department": widget.department,
                                "technologyId": widget.technologyId,
                                "title": widget.title,
                                "stage": widget.stage,
                                "imageUrl": widget.imageUrl
                              }
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "Start Quiz",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
