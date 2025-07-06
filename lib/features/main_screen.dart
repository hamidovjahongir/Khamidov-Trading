import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        backgroundColor: AppColors.barColor,
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppImages.home_),
            icon: SvgPicture.asset(AppImages.home),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppImages.video_),
            icon: SvgPicture.asset(AppImages.video),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppImages.course_),
            icon: SvgPicture.asset(AppImages.course),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppImages.payment_),
            icon: SvgPicture.asset(AppImages.payment),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppImages.profile_),
            icon: SvgPicture.asset(AppImages.profile),
            label: '',
          ),
        ],
      ),
    );
  }
}
