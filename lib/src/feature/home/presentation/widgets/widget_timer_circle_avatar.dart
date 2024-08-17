import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/home/controller/test_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class TimerCircleAvatar extends StatefulWidget {
  final void Function() onTimerEnd;

  const TimerCircleAvatar(this.onTimerEnd, {super.key});

  @override
  State<TimerCircleAvatar> createState() => _TimerCircleAvatarState();
}

class _TimerCircleAvatarState extends State<TimerCircleAvatar> {
  late final TestController controller;
  late Timer countdownTimer;
  final int totalDuration = 15;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 31,
      backgroundColor: AppColors.primaryGreen,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Consumer<TestController>(
            builder: (context, ref, child) {
              return Transform.scale(
                scale: 1.3,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                  value: ref.timer / totalDuration,
                  strokeCap: StrokeCap.round,
                ),
              );
            }
          ),
          Consumer<TestController>(
            builder: (context, ref, child) {
              return Text(
                '${ref.timer}',
                style: const AppTextStyle().labelSmall?.copyWith(fontSize: 18)
              );
            }
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = context.read<TestController>();
    controller.timer = 15;
    countdownTimer = controller.startTimer(widget.onTimerEnd);
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }
}
