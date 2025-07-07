import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final String? imageBase64;
  final double? width;
  final double? height;
  final Color? color;

  UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
    this.imageBase64,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width ?? mediaQueryWidth,
      height: 100.h,
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
                    child: _buildProfileImage(),
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
                        SvgPicture.asset(AppImages.pin),
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

  Widget _buildProfileImage() {
    if (imageBase64 != null && imageBase64!.isNotEmpty) {
      try {
        final cleanBase64 = _cleanBase64String(imageBase64!);
        final bytes = base64Decode(cleanBase64);

        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          width: 60.w,
          height: 60.h,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading base64 image: $error');
            return _buildDefaultImage();
          },
        );
      } catch (e) {
        print('Error decoding base64 image: $e');
        return _buildDefaultImage();
      }
    } else {
      return _buildDefaultImage();
    }
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      AppImages.mask,
      fit: BoxFit.cover,
      width: 60.w,
      height: 60.h,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.lightblack,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(Icons.person, size: 30, color: AppColors.white),
        );
      },
    );
  }

  String _cleanBase64String(String base64String) {
    if (base64String.startsWith('data:')) {
      final commaIndex = base64String.indexOf(',');
      if (commaIndex != -1) {
        base64String = base64String.substring(commaIndex + 1);
      }
    }

    base64String = base64String.replaceAll(RegExp(r'\s'), '');

    final mod = base64String.length % 4;
    if (mod != 0) {
      base64String += '=' * (4 - mod);
    }

    return base64String;
  }
}
