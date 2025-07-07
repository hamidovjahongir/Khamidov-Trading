import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/features/auth/data/datasource/local_datasource.dart';
import 'package:trading_app/features/profile/data/repository/user_local_repository.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();
  final UserLocalRepository userLocalRepository = UserLocalRepository();

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    final savedToken = await authLocalDatasource.getToken();
    final savedUserId = await userLocalRepository.getUserId();
    print("lsdkjfn ${savedUserId}");

    if (user != null && savedToken != null && savedUserId != null) {
      final newToken = await user.getIdToken(true);
      await authLocalDatasource.saveToken(newToken.toString());

      context.goNamed(AppRoutesNames.home);
    } else {
      context.goNamed(AppRoutesNames.splash);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Image.asset(AppImages.rocket, fit: BoxFit.cover)),
    );
  }
}
