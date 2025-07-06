// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';

class WAppBarWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Widget? child;
  final void Function()? onTap;
  WAppBarWidget({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.child,
    this.onTap,
  });

  @override
  State<WAppBarWidget> createState() => _WAppBarWidgetState();
}

class _WAppBarWidgetState extends State<WAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        width: widget.width ?? 40,
        height: widget.height ?? 40,
        decoration: BoxDecoration(
          color: widget.color ?? AppColors.black,
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
        ),
        child: Center(child: widget.child ?? SizedBox()),
      ),
    );
  }
}
