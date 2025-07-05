import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class WRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  final void Function()? onTap;

  const WRichText({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
    this.textStyle1,
    this.textStyle2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: text1,
          style:
              textStyle1 ??
              AppTextStyles.s14w800.copyWith(color: AppColors.gray),
          recognizer: TapGestureRecognizer()..onTap = onTap,
          children: [
            TextSpan(
              text: text2,
              style:
                  textStyle2 ??
                  AppTextStyles.s14w800.copyWith(
                    color: AppColors.darkBlue.withOpacity(0.5),
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
