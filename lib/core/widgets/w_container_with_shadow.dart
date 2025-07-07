import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';

class WContainerWithShadow extends StatelessWidget {
  final Widget child;
  final Color color;
  final BorderRadius? borderRadius;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BoxShape? shape;
  final List<BoxShadow>? shadow;
  final Clip clipBehavior;
  final Color? shadowColor;
  const WContainerWithShadow({
    super.key,
    required this.color,
    required this.child,
    this.borderRadius,
    this.border,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.shape,
    this.shadow,
    this.clipBehavior = Clip.none,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(16.w),
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        border: border ?? Border.all(color: AppColors.white),
        shape: shape ?? BoxShape.rectangle,
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(12.w),
        boxShadow:
            shadow ??
            [
              BoxShadow(
                blurRadius: 30,
                spreadRadius: 0,
                offset: Offset(0, 0),
                color: shadowColor ?? AppColors.blue,
              ),
            ],
      ),
      child: child,
    );
  }
}
