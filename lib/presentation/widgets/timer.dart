import 'package:flutter/material.dart';

import '../../core/costant/color_contant.dart';

class ClockTimer extends StatefulWidget {
  final int postId;

  const ClockTimer({super.key, required this.postId});

  @override
  State<ClockTimer> createState() => _ClockTimerState();
}

class _ClockTimerState extends State<ClockTimer> with TickerProviderStateMixin {
  late AnimationController _timerController;

  @override
  void initState() {
    super.initState();
    // Initialize the timer for this post
    _timerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // 20-second countdown
    )..forward(); // Start the timer immediately
  }

  @override
  void dispose() {
    _timerController.dispose(); // Dispose the timer when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerController,
      builder: (context, child) {
        final remainingTime = (_timerController.duration!.inSeconds *
            (1.0 - _timerController.value))
            .ceil();

        return Container(
          height: 45,
          width: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1, color: AppColors.black),
          ),
          child: Text(
            '${remainingTime}s',
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
