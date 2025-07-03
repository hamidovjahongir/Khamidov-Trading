import 'package:flutter/material.dart';

class FastScaleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final double scaleValue;
  final Duration duration;
  final bool isDisabled;

  const FastScaleButton({
    required this.child,
    this.onTap,
    this.onLongTap,
    this.scaleValue = 0.95,
    this.duration = const Duration(milliseconds: 80),
    this.isDisabled = false,
    super.key,
  });

  @override
  State<FastScaleButton> createState() => _FastScaleButtonState();
}

class _FastScaleButtonState extends State<FastScaleButton> {
  bool _pressed = false;

  void _setPressed(bool val) {
    if (!widget.isDisabled) {
      setState(() => _pressed = val);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) {
        _setPressed(false);
        widget.onTap?.call();
      },
      onTapCancel: () => _setPressed(false),
      onLongPress: widget.onLongTap,
      child: AnimatedScale(
        scale: _pressed ? widget.scaleValue : 1.0,
        duration: widget.duration,
        curve: Curves.fastOutSlowIn,
        child: widget.child,
      ),
    );
  }
}
