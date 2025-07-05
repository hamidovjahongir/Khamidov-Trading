import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_textstyles.dart';
import 'w_app_bar_widget.dart';

class WCustomAppBar extends StatelessWidget {
  final String? title;
  final bool back;

  const WCustomAppBar({super.key, this.title, this.back = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        back
            ? WAppBarWidget(
              child: Center(
                child: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
              ),
            )
            : Expanded(child: Text(title ?? '', style: AppTextStyles.s20w400)),
        back
            ? Expanded(
              child: Center(
                child: Text(title ?? '', style: AppTextStyles.s20w400),
              ),
            )
            : const Spacer(),
        WAppBarWidget(child: Center(child: SvgPicture.asset(AppImages.logout))),
      ],
    );
  }
}
