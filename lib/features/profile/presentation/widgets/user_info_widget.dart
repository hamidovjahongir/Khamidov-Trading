import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final Image? image;
  final double? width;
  final double? height;
  final Color? color;
  UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
    this.image,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width ?? mediaQueryWidth,
      height: 110.h,
      decoration: BoxDecoration(
        color: color ?? AppColors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: image ?? SizedBox(),
                  ),
                ),
                10.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.height,
                    Row(
                      children: [
                        Text(name, style: AppTextStyles.s20w600.copyWith()),
                        SvgPicture.asset(AppImages.pinpng),
                      ],
                    ),
                    Text(
                      email,
                      style: AppTextStyles.s14w400.copyWith(
                        color: AppColors.lightblack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
