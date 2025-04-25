import 'package:dsa_teaching_web/core/constants/animation.dart';
import 'package:flutter/material.dart';

class TapAnimatedWidget extends StatefulWidget {
  const TapAnimatedWidget({
    required this.child,
    required this.onTap,
    this.duration = AnimationDuration.animationTapDuration,
    this.beginOpacity = 1.0,
    this.endOpacity = 0.5,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;
  final double beginOpacity;
  final double endOpacity;

  @override
  State<TapAnimatedWidget> createState() => _TapAnimatedWidgetState();
}

class _TapAnimatedWidgetState extends State<TapAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween(
      begin: widget.beginOpacity,
      end: widget.endOpacity,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      key: widget.key,
      behavior: HitTestBehavior.opaque,
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }

  Future<void> _onTapUp(TapUpDetails details) async {
    if (widget.onTap != null) {
      await _controller.forward();
      widget.onTap!();
      await _controller.reverse();
    }
  }

  Future<void> _onTapDown(TapDownDetails details) async {
    await _controller.forward();
  }

  Future<void> _onTapCancel() async {
    await _controller.reverse();
  }
}
