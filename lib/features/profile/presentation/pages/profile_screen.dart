import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/features/auth/data/datasource/local_datasource.dart';

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
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text('Profil', style: AppTextStyles.s20w800.copyWith()),
        actions: [
          IconButton(
            onPressed: () {
              db.removeToken();
              context.go(AppRoutesNames.login);
            },
            icon: Icon(Icons.login, color: AppColors.white),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        
        ],
            ),
      ),
    );
  }
}
