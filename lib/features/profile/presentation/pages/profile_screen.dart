import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/features/auth/data/datasource/local_datasource.dart';
import 'package:trading_app/features/profile/presentation/widgets/log_out_widget.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_bloc.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_event.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_state.dart';
import 'package:trading_app/features/profile/presentation/widgets/profile_items_widget.dart';
import 'package:trading_app/features/profile/presentation/widgets/user_info_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUserEvent());
  }

  final db = AuthLocalDatasource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserLoadedState) {
            final user = state.user;
            return WCustomBackground(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    WCustomAppBar(
                      back: false,
                      title: 'Profil',

                      actionVoidCallback: () {
                        chiq();
                        context.go(AppRoutesNames.login);
                      },
                    ),
                    20.height,
                    UserInfoWidget(
                      name: state.user.fullName ?? '',
                      email: state.user.email ?? '',
                      imageBase64: user.image,
                    ),
                    20.height,
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 5,
                        itemBuilder:
                            (context, index) => ProfileItems(index: index),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is UserErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.error}',
                    style: AppTextStyles.s16w400.copyWith(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserBloc>().add(LoadUserEvent());
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
