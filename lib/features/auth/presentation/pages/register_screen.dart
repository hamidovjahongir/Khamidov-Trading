import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/core/widgets/w_container_with_shadow.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/core/widgets/w_gradient_container.dart';
import 'package:trading_app/core/widgets/w_rich_text.dart';
import 'package:trading_app/core/widgets/w_text_field.dart';
import 'package:trading_app/features/auth/data/model/auth_model.dart';
import 'package:trading_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trading_app/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:trading_app/features/auth/presentation/widget/security_modal_widget.dart';
import 'package:trading_app/features/profile/data/model/user_model.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_bloc.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
          SignUpRequested(
            AuthModel(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
      }
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ism va familiya kiritilishi shart';
    }
    if (value.length < 3) {
      return 'Ism va familiya kamida 3 ta belgidan iborat bo\'lishi kerak';
    }
    return null;
  }

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parol kiritilishi shart';
    }
    if (value.length < 6) {
      return 'Parol kamida 6 ta belgidan iborat bo\'lishi kerak';
    }
    return null;
  }

  // String? _validateConfirmPassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Parolni tasdiqlash shart';
  //   }
  //   if (value != passwordController.text) {
  //     return 'Parollar mos kelmaydi';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: WCustomBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => SecurityModalWidget(
                            image: Image.asset(AppImages.trueIcon),
                            title: 'Muvaffaqiyatli royxatdan otdingiz',
                            page: '/home',
                          ),
                    );

                    context.read<UserBloc>().add(
                      AddUserEvent(
                        UserModel(
                          email: emailController.text,
                          fullName: nameController.text,
                          birthDate: '',
                          image: '',
                          phoneNumber: '',
                        ),
                      ),
                    );
                  }
                  if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RO’YXATDAN O’TISH',
                        style: AppTextStyles.s16w700.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      30.height,

                      Column(
                        spacing: 20,
                        children: [
                          WTextField(
                            fillColor: AppColors.black,
                            controller: nameController,
                            titleIcon: Icon(
                              Icons.person_2_outlined,
                              color: AppColors.white,
                            ),
                            title: 'Ism va Familiya:',
                            hintText: 'Suratbek Toliboy',
                            borderRadius: 15,
                            validator: _validateName,
                          ),
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
                          BlocBuilder<PasswordVisibilityCubit, bool>(
                            builder: (context, isVisible) {
                              return WTextField(
                                isObscureText: !isVisible,
                                controller: passwordController,
                                titleIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.white,
                                ),
                                title: 'Parol:',
                                hintText: 'password',
                                borderRadius: 15,
                                suffixIcon: GestureDetector(
                                  onTap:
                                      () =>
                                          context
                                              .read<PasswordVisibilityCubit>()
                                              .toggle(),
                                  child: Icon(
                                    isVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.gray,
                                  ),
                                ),
                                onTapSuffix: () {},
                                validator: _validatePassword,
                              );
                            },
                          ),
                          // WTextField(
                          //   controller: confirmPasswordController,
                          //   title: 'Parolni tasdiqlang:',
                          //   hintText: 'password',
                          //   borderRadius: 15,
                          //   isObscureText: true,
                          //   suffixIcon: Icon(
                          //     Icons.visibility_outlined,
                          //     color: AppColors.gray,
                          //   ),
                          //   onTapSuffix: () {},
                          //   validator: _validateConfirmPassword,
                          // ),
                        ],
                      ),
                      30.height,
                      WGradientContainer(
                        isTextVisible: state is! AuthLoading,
                        onTap: _register,
                        height: 50,
                        borderRadius: BorderRadius.circular(15),
                        colors: [AppColors.darkBlue, AppColors.blue],
                        child: Center(
                          child: Text(
                            'Davom etish',
                            style: AppTextStyles.s16w500.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      30.height,
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            width: mediaQueryWidth * 0.38,
                            height: 2,
                            color: AppColors.gray,
                          ),
                          Text(
                            'yoki',
                            style: AppTextStyles.s14w500.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.38,
                            height: 2,
                            color: AppColors.gray,
                          ),
                        ],
                      ),
                      30.height,
                      WContainerWithShadow(
                        height: 55,
                        shadow: [],
                        // border: Border.all(color: AppColors.white),
                        color: AppColors.black,
                        child: Center(
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.google),
                              Text(
                                'Continue with Google',
                                style: AppTextStyles.s14w800.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.height,
                      WContainerWithShadow(
                        height: 55,
                        shadow: [],
                        // border: Border.all(color: AppColors.white),
                        color: AppColors.black,
                        child: Center(
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.apple),
                              Text(
                                'Continue with Apple',
                                style: AppTextStyles.s14w800.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight * 0.18),
                      WRichText(
                        onTap: () => context.go(AppRoutesNames.login),
                        text1: 'Akkauntingiz bormi?',
                        text2: ' Kirish',
                      ),
                      50.height,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
