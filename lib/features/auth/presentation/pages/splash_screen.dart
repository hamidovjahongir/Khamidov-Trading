import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/widgets/w_container_with_shadow.dart';
import 'package:trading_app/core/widgets/w_scale_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(AppImages.rocket, fit: BoxFit.cover),
                  Positioned(
                    right: 50,
                    bottom: 10,
                    child: Image.asset(AppImages.trueIcon),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'KELAJAK KASBI “TRADINGNI”\nBIZ BILAN MUKAMMAL O’RGANING',
                  style: AppTextStyles.s18w700.copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
                10.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Tradingni o’rganmoqchi bo’lsangiz ushbu ilova orqali ro’yxatdan o’ting va Professional Trader bo’ling!',
                    style: AppTextStyles.s12w400.copyWith(
                      fontSize: 13,
                      color: AppColors.white.withOpacity(0.27),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 40,
                  color: AppColors.white.withOpacity(0.27),
                ),

                FastScaleButton(
                  child: WContainerWithShadow(
                    padding: EdgeInsets.zero,
                    width: mediaQueryWidth * 0.6,
                    height: 50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                    color: AppColors.blue.withOpacity(0.73),
                    child: Center(
                      child: Text(
                        'RO’YXATDAN O’TISH',
                        style: AppTextStyles.s16w800.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.login,
                      color: AppColors.white.withOpacity(0.27),
                      size: 26,
                    ),
                    Text(
                      'KIRISH',
                      style: AppTextStyles.s14w500.copyWith(
                        color: AppColors.white.withOpacity(0.27),
                      ),
                    ),
                    100.height,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
