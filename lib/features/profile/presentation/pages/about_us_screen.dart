import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/extensions/widget_extensions.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: WCustomAppBar(
                  leadingVoidCallback: () => context.pop(),
                  showActionIcon: false,
                  title: 'Biz haqimizda',
                ),
              ),
              35.height,
              Image.asset(AppImages.backLogoImage, fit: BoxFit.cover),

              Column(
                spacing: 10.h,
                children: [
                  Text(
                    "Arashov Trading Akademiyasi 2022-yili 11-noyabr kuni tashkil qilingan. Asoschisi Arashov Suxrob Tolibjonovich 6 yillik ish tajribasiga ega bo'lgan professional trader. Akademiyamizda shu kungacha 150 dan ortiq traderlar yetishib chiqqan. ",
                    style: AppTextStyles.s16w700.copyWith(fontSize: 16.5),
                    textAlign: TextAlign.start,
                  ).paddingSymmetric(horizontal: 40),

                  Text(
                    "  Arashov Trading Akademiyasi 2022-yili 11-noyabr kuni tashkil qilingan. Asoschisi Arashov Suxrob Tolibjonovich 6 yillik ish tajribasiga ega bo'lgan professional trader. Akademiyamizda shu kungacha 150 dan ortiq traderlar yetishib chiqqan.  Hozirgi vaqtda Akademiyamizda 2 ta smenada dars o'tiladi. Yangi strategiyalar bilan yanada mukkammal va zamonaviy dars jaroyonlari o'quvchilarimizning yaxshi daromadga chiqishiga xizmat qilmoqda. Darslarimiz online va offline tarzda bo'ladi. Har bir darsdagi mavzular mukammal tarzda o’rgatiladi. Hozirgi vaqitda O'zbekistondagi eng yaxshi trading markazlaridan biri.",
                    style: AppTextStyles.s16w700.copyWith(fontSize: 16.5),
                    textAlign: TextAlign.start,
                  ).paddingSymmetric(horizontal: 40),

                  Text(
                    'Kurslarimiz haqida batafsil ma’lumot olish uchun“       Kurslar ” bo’limiga o’ting ',
                    style: AppTextStyles.s16w700.copyWith(fontSize: 16.5),
                    textAlign: TextAlign.start,
                  ).paddingSymmetric(horizontal: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
