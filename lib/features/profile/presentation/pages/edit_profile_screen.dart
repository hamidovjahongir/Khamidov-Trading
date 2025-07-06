import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController dateController = TextEditingController();
  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      String formatted = DateFormat('dd-MM-yyyy').format(date);
      dateController.text = formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WCustomAppBar(
                title: 'Profil',
                leadingVoidCallback: () => context.pop(),
              ),
              30.height,
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 105.w,
                        height: 105.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(AppImages.mask, fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 75,
                        child: IconButton(
                          onPressed: () {},
                          icon: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: AppColors.barColor,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.blue,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  Text('Khamidov', style: AppTextStyles.s20w400),
                  Text(
                    'Tolibov Suxrobjon',
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              20.height,
              Column(
                spacing: 12,
                children: [
                  WTextField(
                    prefix: WAppBarWidget(
                      color: AppColors.backBlackColor,
                      child: Center(child: SvgPicture.asset(AppImages.person)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: 'Ism Familiya',
                    borderRadius: 15,
                  ),
                  WTextField(
                    keyBoardType: TextInputType.emailAddress,
                    prefix: WAppBarWidget(
                      color: AppColors.backBlackColor,
                      child: Center(child: SvgPicture.asset(AppImages.email)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: 'namuna@gmail.com',
                    borderRadius: 15,
                  ),
                  WTextField(
                    keyBoardType: TextInputType.number,

                    prefix: WAppBarWidget(
                      color: AppColors.backBlackColor,
                      child: Center(child: SvgPicture.asset(AppImages.phone)),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: '+998 (XX) XXX-XX-XX',
                    borderRadius: 15,
                  ),
                  WTextField(
                    controller: dateController,
                    keyBoardType: TextInputType.datetime,
                    readonly: true,
                    onTap: _pickDate,
                    prefix: WAppBarWidget(
                      color: AppColors.backBlackColor,
                      child: Center(
                        child: SvgPicture.asset(AppImages.calendar),
                      ),
                    ).paddingSymmetric(horizontal: 10, vertical: 10),
                    hintText: 'kk-oo-yyyy',
                    borderRadius: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Container(
                        width: 160,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.backBlackColor,
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset(AppImages.delate),
                            Text(
                              'Akkauntni o’chirish',
                              style: AppTextStyles.s14w400,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 5),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: WGradientContainer(
          onTap: () {},
          height: 50,
          borderRadius: BorderRadius.circular(15),
          colors: [AppColors.darkBlue, AppColors.blue],
          child: Center(
            child: Text(
              'Saqlash',
              style: AppTextStyles.s16w500.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
