import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/widgets/w_app_bar_widget.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class VideoLessonScreen extends StatefulWidget {
  const VideoLessonScreen({super.key});

  @override
  State<VideoLessonScreen> createState() => _VideoLessonScreenState();
}

class _VideoLessonScreenState extends State<VideoLessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: WAppBarWidget(
      //     child: Icon(Icons.arrow_back_ios, color: AppColors.white),
      //   ),
      //   title: Text('Premium video-darsliklar', style: AppTextStyles.s16w800),
      // ),
      backgroundColor: AppColors.black,
      body: WCustomBackground(child: Column(children: [

        ],
      )),
    );
  }
}
