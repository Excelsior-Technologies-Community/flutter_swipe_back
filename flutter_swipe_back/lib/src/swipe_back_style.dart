import 'package:flutter/material.dart';

class SwipeBackStyle {
  final double swipeThreshold;
  final double maxSlide;
  final Duration animationDuration;
  final Curve animationCurve;
  final Color backgroundColor;
  final BoxShadow? shadow;

  const SwipeBackStyle({
    this.swipeThreshold = 0.25,
    this.maxSlide = 120,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve = Curves.easeOut,
    this.backgroundColor = Colors.black12,
    this.shadow,
  });
}