import 'package:flutter/material.dart';
import 'swipe_back_controller.dart';
import 'swipe_back_style.dart';

class SwipeBack extends StatefulWidget {
  final Widget child;
  final SwipeBackController? controller;
  final SwipeBackStyle style;
  final bool enabled;
  final VoidCallback? onSwipeStart;
  final VoidCallback? onSwipeUpdate;
  final VoidCallback? onSwipeCancel;
  final VoidCallback? onSwipeComplete;

  const SwipeBack({
    super.key,
    required this.child,
    this.controller,
    this.style = const SwipeBackStyle(),
    this.enabled = true,
    this.onSwipeStart,
    this.onSwipeUpdate,
    this.onSwipeCancel,
    this.onSwipeComplete,
  });

  @override
  State<SwipeBack> createState() => _SwipeBackState();
}

class _SwipeBackState extends State<SwipeBack>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  double _drag = 0;
  bool _dragging = false;

  SwipeBackController? _internalController;

  SwipeBackController get _controller {
    _internalController ??= widget.controller ?? SwipeBackController();
    return _internalController!;
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.style.animationDuration,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.style.animationCurve,
      ),
    )
      ..addListener(() {
        setState(() {
          _drag = _animation.value;
          _controller.update(_drag);
        });
      });
  }

  void _animateTo(double target) {
    _animation = Tween<double>(
      begin: _drag,
      end: target,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.style.animationCurve,
      ),
    )
      ..addListener(() {
        setState(() {
          _drag = _animation.value;
          _controller.update(_drag);
        });
      });

    _animationController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: widget.enabled
          ? (details) {
        if (details.globalPosition.dx <= 40) {
          _dragging = true;
          widget.onSwipeStart?.call();
        }
      }
          : null,
      onHorizontalDragUpdate: widget.enabled
          ? (details) {
        if (!_dragging) return;

        setState(() {
          _drag += (details.primaryDelta ?? 0) / width;
          _drag = _drag.clamp(0.0, 1.0);
        });

        _controller.update(_drag);
        widget.onSwipeUpdate?.call();
      }
          : null,
      onHorizontalDragEnd: widget.enabled
          ? (details) {
        if (!_dragging) return;

        _dragging = false;

        if (_drag >= widget.style.swipeThreshold) {
          widget.onSwipeComplete?.call();
          _animateTo(1.0);

          Future.delayed(widget.style.animationDuration, () {
            if (mounted && Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          });
        } else {
          widget.onSwipeCancel?.call();
          _animateTo(0.0);
        }
      }
          : null,
      child: Stack(
        children: [
          Container(
            color: widget.style.backgroundColor,
          ),
          Transform.translate(
            offset: Offset(_drag * widget.style.maxSlide, 0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  widget.style.shadow ??
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(-2, 0),
                      ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}