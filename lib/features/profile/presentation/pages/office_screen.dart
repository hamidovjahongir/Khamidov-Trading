import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/features/profile/presentation/widgets/user_location.dart';

class OfficeScreen extends StatefulWidget {
  const OfficeScreen({super.key});

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WCustomBackground(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WCustomAppBar(
                  leadingVoidCallback: () => context.pop(),
                  showActionIcon: false,
                  title: 'Ofis manzili',
                ),
                40.height,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: Image.asset(
                    AppImages.officeLocation,
                    width: MediaQuery.of(context).size.width,
                    height: 320.h,
                    fit: BoxFit.cover,
                  ),
                ),
                18.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Neus Business Center',
                      style: AppTextStyles.s26w800.copyWith(fontSize: 30),
                    ),
                    Text(
                      'Chilonzor 2-kvartal',
                      style: AppTextStyles.s24w500.copyWith(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'Arnasoy 76',
                      style: AppTextStyles.s24w500.copyWith(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                20.height,

                MapWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
