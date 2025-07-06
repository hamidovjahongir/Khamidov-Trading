import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/extensions/widget_extensions.dart';
import 'package:trading_app/core/widgets/w_app_bar_widget.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/core/widgets/w_gradient_container.dart';
import 'package:trading_app/core/widgets/w_text_field.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              WCustomAppBar(
                leadingVoidCallback: () => context.pop(),
                showActionIcon: false,
                title: 'Qo’llab quvvatlash',
              ),
              20.height,
              Align(child: Image.asset(AppImages.messages, fit: BoxFit.cover)),
              WGradientContainer(
                padding: EdgeInsets.zero,
                height: 230,
                colors: [AppColors.backBlackColor2, AppColors.lightBlue],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Xatolik va takliflar haqida bizga murojaat qiling',
                      style: AppTextStyles.s24w400,
                      textAlign: TextAlign.center,
                    ).paddingSymmetric(horizontal: 20),
                    Text(
                      'Ilovadagi barcha muammolarni birgalikda hal qilamiz, murojaat qilganingiz uchun rahmat!',

                      style: AppTextStyles.s16w700.copyWith(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                      textAlign: TextAlign.center,
                    ).paddingSymmetric(horizontal: 10),
                  ],
                ).paddingSymmetric(horizontal: 10, vertical: 10),
              ),

              15.height,
              Column(
                spacing: 10,
                children: [
                  WTextField(
                    focusedColor: AppColors.black,

                    borderColor: AppColors.black,
                    
                    readonly: true,
                    keyBoardType: TextInputType.emailAddress,
                    prefix: WAppBarWidget(
                      color: AppColors.blue,
                      child: Center(child: Icon(Icons.telegram)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: 'Khamidov Manager',
                    hintTextStyle: AppTextStyles.s16w600,
                    borderRadius: 15,
                  ),
                  WTextField(
                    borderColor: AppColors.black,
                    focusedColor: AppColors.black,
                    readonly: true,
                    keyBoardType: TextInputType.emailAddress,
                    prefix: WAppBarWidget(
                      color: Color(0xff19DD8B),
                      child: Center(child: SvgPicture.asset(AppImages.phone)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: '+998 95 505 11 99',
                    hintTextStyle: AppTextStyles.s16w600,

                    borderRadius: 15,
                  ),
                  WTextField(
                    focusedColor: AppColors.black,
                    borderColor: AppColors.black,
                    readonly: true,
                    keyBoardType: TextInputType.emailAddress,
                    prefix: WAppBarWidget(
                      color: AppColors.backBlackColor,
                      child: Center(child: SvgPicture.asset(AppImages.email)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: 'ArashovSupport@gmail.comr',
                    hintTextStyle: AppTextStyles.s16w600,

                    borderRadius: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
