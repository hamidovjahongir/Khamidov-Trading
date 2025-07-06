import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: WCustomBackground(child: Column(children: [

      ],
    )),
    );
  }
}
