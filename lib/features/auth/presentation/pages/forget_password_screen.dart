import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/core/widgets/w_gradient_container.dart';
import 'package:trading_app/core/widgets/w_text_field.dart';
import 'package:trading_app/features/auth/presentation/cubits/forget_password_cubit.dart';
import 'package:trading_app/features/auth/presentation/widget/security_modal_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email kiritilishi shart';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'To\'g\'ri email formatini kiriting';
    }
    return null;
  }

  void _forgetPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().sendResetLink(
        emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: WCustomBackground(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (context) => SecurityModalWidget(
                      image: Image.asset(AppImages.trueIcon),
                      title:
                          'Emailingizga parolni qayta tiklash muvaffaqiyatli jonatildi',
                      page: '/login',
                    ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Parolni tiklash',
                            style: AppTextStyles.s16w700.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      40.height,
                      Image.asset(AppImages.lockIcon),
                      20.height,
                      Text(
                        "Parolni tiklash uchun ro'yxatdan\no'tgan elektron pochtangizni kiriting",
                        style: AppTextStyles.s16w500,
                        textAlign: TextAlign.center,
                      ),
                      30.height,
                      WTextField(
                        titleIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.white,
                        ),
                        controller: emailController,
                        title: 'E-MAIL:',
                        hintText: 'ism.familiya@gmail.com',
                        borderRadius: 15,
                        keyBoardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                      ),
                      26.height,
                      WGradientContainer(
                        colors: [AppColors.darkBlue, AppColors.blue],
                        onTap:
                            state is ForgetPasswordLoading
                                ? null
                                : _forgetPassword,
                        height: 50,
                        borderRadius: BorderRadius.circular(15),

                        child: Center(
                          child:
                              state is ForgetPasswordLoading
                                  ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                  : Text(
                                    'Davom etish',
                                    style: AppTextStyles.s16w500.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
