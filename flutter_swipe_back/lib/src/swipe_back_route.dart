import 'package:flutter/material.dart';
import 'swipe_back.dart';

class SwipeBackPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SwipeBackPageRoute({
    required this.page,
    super.settings,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SwipeBack(
        child: page,
      );
    },
    transitionsBuilder:
        (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 250),
  );
}