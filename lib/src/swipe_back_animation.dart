import 'package:flutter/material.dart';

class SwipeBackAnimation extends StatelessWidget {
  final Widget child;
  final double progress;

  const SwipeBackAnimation({
    super.key,
    required this.child,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(progress * 300, 0),
      child: child,
    );
  }
}