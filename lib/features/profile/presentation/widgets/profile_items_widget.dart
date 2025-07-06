import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/routes/route_names.dart';
import '../../../../core/constants/app_images.dart';

class ProfileItems extends StatefulWidget {
  final int index;
  const ProfileItems({super.key, required this.index});

  @override
  State<ProfileItems> createState() => _ProfileItemsState();
}

class _ProfileItemsState extends State<ProfileItems> {
  ValueNotifier<bool> isSwitch = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': AppImages.edit,
        'title': 'Edit profile',
        'onTap': () {
          context.pushNamed(AppRoutesNames.editProfile);
        },
      },

      {
        'icon': AppImages.location,
        'title': 'Ofis manzili',
        'onTap': () {
          context.push(AppRoutesNames.officeLocation);
        },
      },

      {
        'icon': AppImages.headset,
        'title': 'Qo’llab quvvatlash',
        'onTap': () {
          context.push(AppRoutesNames.support);
        },
      },
      {
        'icon': AppImages.list,
        'title': 'Biz haqimizda',
        'onTap': () {
          context.push(AppRoutesNames.aboutUs);
        },
      },

      {
        'icon': AppImages.sun,
        'title': 'Dark theme',
        'onTap': () {
          context.push(AppRoutesNames.aboutUs);
        },
      },
    ];
    final item = items[widget.index];
    return GestureDetector(
      onTap: item["onTap"],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset(item["icon"], fit: BoxFit.cover),
                    Text(item["title"], style: AppTextStyles.s20w700),
                  ],
                ),
                if (widget.index == 4)
                  ValueListenableBuilder(
                    valueListenable: isSwitch,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        toggleSize: 20,
                        width: 50,
                        height: 30,
                        value: value,
                        onToggle: (val) {
                          isSwitch.value = val;
                        },
                      );
                    },
                  )
                else if (widget.index == 4)
                  const SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: 20),
          widget.index == 4
              ? SizedBox()
              : Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Color(0xff212433),
              ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
