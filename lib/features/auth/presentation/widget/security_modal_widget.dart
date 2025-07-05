import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';

class SecurityModalWidget extends StatefulWidget {
  final Image? image;
  final String? title;
  final String page;
  final String? buttonTitle;
  final Color? color;

  const SecurityModalWidget({
    Key? key,
    this.image,
    required this.page,
    this.buttonTitle,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  State<SecurityModalWidget> createState() => _SecurityModalWidgetState();
}

class _SecurityModalWidgetState extends State<SecurityModalWidget> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      context.go(widget.page);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.38),
                borderRadius: BorderRadius.circular(40),
              ),
              width: 270,
              height: 270,
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.image ?? SizedBox(),
                  Text(
                    widget.title ?? '',
                    style: AppTextStyles.s16w800,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
