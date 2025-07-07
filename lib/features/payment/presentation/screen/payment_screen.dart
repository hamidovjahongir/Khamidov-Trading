import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/extensions/widget_extensions.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/core/widgets/w_container_with_shadow.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/core/widgets/w_gradient_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.history,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Umumiy balans',
                      style: AppTextStyles.s20w600.copyWith(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),

                    Text(
                      '1250\$',
                      style: AppTextStyles.s26w600.copyWith(fontSize: 40),
                    ),
                  ],
                ),
                20.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WContainerWithShadow(
                        padding: EdgeInsets.all(10),
                        border: Border(),
                        width: mediaQueryWidth * 0.4,
                        height: 85.h,
                        color: AppColors.backBlackColor,
                        shadowColor: AppColors.black,
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset(
                              AppImages.dollar,
                              width: 30,
                              height: 30,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('0\$', style: AppTextStyles.s20w600),
                                Text(
                                  'Umumiy qilingan\n daromad',
                                  style: AppTextStyles.s12w600.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      WContainerWithShadow(
                        padding: EdgeInsets.all(10),
                        border: Border(),
                        width: mediaQueryWidth * 0.4,
                        height: 85.h,
                        color: AppColors.backBlackColor,
                        shadowColor: AppColors.black,
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset(
                              AppImages.dollar,
                              width: 30,
                              height: 30,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('0\$', style: AppTextStyles.s20w600),
                                Text(
                                  'Umumiy qilingan\n daromad',
                                  style: AppTextStyles.s12w600.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                // WGradientContainer(
                //   borderRadius: BorderRadius.circular(radius),
                //   padding: EdgeInsets.symmetric(vertical: 15),
                //   width: mediaQueryWidth,
                //   height: mediaQueryHeight * 0.18,
                //   colors: [
                //     Color(0xff111423),
                //     Color(0xff121F37),
                //     Color(0xff083F80),
                //   ],
                //   child: Row(
                //     spacing: 7,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SvgPicture.asset(AppImages.error),

                //       Column(
                //         spacing: 5,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             'Ushbu bo’limdan Premium video-darslikni\nxarid qilganlar daromad qilishi mumkin!',
                //             style: AppTextStyles.s14w600.copyWith(),
                //           ),
                //           Text(
                //             'Siz ham qo’shimcha daromad qilishni xohlasangiz\nPremium kursga a’zo bo’lib, promokodga ega bo’ling',
                //             style: AppTextStyles.s12w600.copyWith(
                //               color: AppColors.white.withOpacity(0.5),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ).paddingSymmetric(horizontal: 20),
                // ),
                GestureDetector(
                  onTap: () => context.go(AppRoutesNames.paymentMethod),
                  child: WContainerWithShadow(
                    padding: EdgeInsets.zero,
                    height: 40,
                    border: Border(),
                    shadow: [],
                    color: AppColors.darkBlue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.send),
                        Text('Chiqarib olish', style: AppTextStyles.s16w400),
                      ],
                    ),
                  ),
                ),
                30.height,
                WContainerWithShadow(
                  height: 100,
                  shadow: [],
                  border: Border(),
                  color: AppColors.backBlackColor,
                  child: Row(
                    children: [
                      Image.asset(AppImages.bitcoin),
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Promokod:', style: AppTextStyles.s14w400),
                          WContainerWithShadow(
                            shadowColor: AppColors.barColor,

                            width: 190,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            border: Border(),
                            shadow: [],
                            color: AppColors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Khamidov', style: AppTextStyles.s20w400),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.copy,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Qanday daromad qilish mumkin',
                      style: AppTextStyles.s16w400,
                    ),
                  ],
                ),
                20.height,
                WContainerWithShadow(
                  // height: mediaQueryHeight * 0.21,
                  shadowColor: AppColors.barColor,
                  border: Border(),
                  color: AppColors.backBlackColor,
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            '1',
                            style: AppTextStyles.s16w800.copyWith(
                              color: AppColors.blue,
                            ),
                          ),

                          Text(
                            'Do’stingizni taklif qiling',
                            style: AppTextStyles.s14w500,
                          ),
                        ],
                      ),

                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            '2',
                            style: AppTextStyles.s16w800.copyWith(
                              color: AppColors.blue,
                            ),
                          ),

                          Text(
                            "Ular ro'yxatdan o’tib\nPromokod orqali Premium kursni\nxarid qilishsin.",
                            style: AppTextStyles.s14w500,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            '3',
                            style: AppTextStyles.s16w800.copyWith(
                              color: AppColors.blue,
                            ),
                          ),

                          Text(
                            'Xarid qilingan har bir kurs uchun\n50\$ dan daromad qilasiz!',
                            style: AppTextStyles.s14w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                50.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
