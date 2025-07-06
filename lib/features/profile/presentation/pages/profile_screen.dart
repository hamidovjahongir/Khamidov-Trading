import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/features/auth/data/datasource/local_datasource.dart';
import 'package:trading_app/features/profile/presentation/widgets/profile_items_widget.dart';
import 'package:trading_app/features/profile/presentation/widgets/user_info_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final db = AuthLocalDatasource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              WCustomAppBar(
                back: false,
                title: 'Profil',
                actionVoidCallback: () => context.go(AppRoutesNames.login),
              ),
              20.height,
              UserInfoWidget(
                name: 'Khamidov',
                email: 'arashov@gmail.com',
                image: Image.asset(AppImages.mask, fit: BoxFit.cover),
              ),
              20.height,
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) => ProfileItems(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
