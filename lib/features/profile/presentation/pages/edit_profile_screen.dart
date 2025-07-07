import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/extensions/widget_extensions.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/core/widgets/w_app_bar_widget.dart';
import 'package:trading_app/core/widgets/w_custom_app_bar.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/core/widgets/w_gradient_container.dart';
import 'package:trading_app/core/widgets/w_text_field.dart';
import 'package:trading_app/features/profile/presentation/widgets/log_out_widget.dart';
import 'package:trading_app/features/profile/data/repository/user_local_repository.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_bloc.dart';
import 'package:trading_app/features/profile/data/model/user_model.dart';
import 'package:intl/intl.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_event.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_state.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final localDb = UserLocalRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedImageBase64;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final userState = context.read<UserBloc>().state;
    if (userState is UserLoadedState) {
      selectedImageBase64 = userState.user.image ?? '';
      nameController.text = userState.user.fullName ?? '';
      emailController.text = userState.user.email ?? '';
      phoneController.text = userState.user.phoneNumber ?? '';
      dateController.text = userState.user.birthDate ?? '';
    }
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      String formatted = DateFormat('dd-MM-yyyy').format(date);
      dateController.text = formatted;
    }
  }

  Future<bool> requestGalleryPermission() async {
    var photos = await Permission.photos.status;
    var storage = await Permission.storage.status;

    if (photos.isGranted || storage.isGranted) {
      return true;
    }

    var reqPhotos = await Permission.photos.request();
    var reqStorage = await Permission.storage.request();

    if (reqPhotos.isGranted || reqStorage.isGranted) {
      return true;
    }

    if (reqPhotos.isPermanentlyDenied || reqStorage.isPermanentlyDenied) {
      await openAppSettings();
    }

    return false;
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await File(image.path).readAsBytes();
      selectedImageBase64 = base64Encode(bytes);
      setState(() {});
    }
  }

  void _saveProfile() async {
    final id = await localDb.getUserId();

    if (_formKey.currentState!.validate()) {
      final updatedUser = UserModel(
        image: selectedImageBase64,
        fullName: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        birthDate: dateController.text,
      );

      context.read<UserBloc>().add(EditUserEvent(id.toString(), updatedUser));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profil malumotlari saqlandi'),
          backgroundColor: AppColors.blue,
        ),
      );
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

  String? _validatePhone(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length < 9) {
        return 'Telefon raqami noto\'g\'ri';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UserLoadedState) {
                    nameController.text = state.user.fullName ?? '';
                    emailController.text = state.user.email ?? '';
                    phoneController.text = state.user.phoneNumber ?? '';
                    dateController.text = state.user.birthDate ?? '';
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WCustomAppBar(
                        actionVoidCallback: () {
                          chiq();
                          context.go(AppRoutesNames.login);
                        },
                        title: 'Profil',
                        leadingVoidCallback: () => context.pop(),
                      ),
                      30.height,
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 105.w,
                                height: 105.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.blue),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                      selectedImageBase64 != null
                                          ? Image.memory(
                                            base64Decode(selectedImageBase64!),
                                            fit: BoxFit.cover,
                                          )
                                          : Image.asset(
                                            AppImages.mask,
                                            fit: BoxFit.cover,
                                          ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                left: 75,
                                child: IconButton(
                                  onPressed: () async {
                                    bool granted =
                                        await requestGalleryPermission();
                                    if (granted) {
                                      await _pickImage();
                                    }
                                  },
                                  icon: Container(
                                    width: 25.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.barColor,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.blue,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.height,
                          Text(
                            nameController.text.isNotEmpty
                                ? nameController.text.split(' ').first
                                : 'Foydalanuvchi',
                            style: AppTextStyles.s20w400,
                          ),
                          Text(
                            nameController.text.isNotEmpty
                                ? nameController.text
                                : 'Ism kiritilmagan',
                            style: AppTextStyles.s14w400.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      20.height,
                      Column(
                        spacing: 12,
                        children: [
                          WTextField(
                            controller: nameController,
                            prefix: WAppBarWidget(
                              color: AppColors.backBlackColor,
                              child: Center(
                                child: SvgPicture.asset(AppImages.person),
                              ),
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                            hintText: 'Ism Familiya',
                            borderRadius: 15,
                            validator: _validateName,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          WTextField(
                            readonly: true,
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            prefix: WAppBarWidget(
                              color: AppColors.backBlackColor,
                              child: Center(
                                child: SvgPicture.asset(AppImages.email),
                              ),
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                            hintText: 'namuna@gmail.com',
                            borderRadius: 15,
                            validator: _validateEmail,
                          ),
                          WTextField(
                            controller: phoneController,
                            keyBoardType: TextInputType.phone,
                            prefix: WAppBarWidget(
                              color: AppColors.backBlackColor,
                              child: Center(
                                child: SvgPicture.asset(AppImages.phone),
                              ),
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                            hintText: '+998 (XX) XXX-XX-XX',
                            borderRadius: 15,
                            validator: _validatePhone,
                          ),
                          WTextField(
                            controller: dateController,
                            keyBoardType: TextInputType.datetime,
                            readonly: true,
                            onTap: _pickDate,
                            prefix: WAppBarWidget(
                              color: AppColors.backBlackColor,
                              child: Center(
                                child: SvgPicture.asset(AppImages.calendar),
                              ),
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                            hintText: 'kk-oo-yyyy',
                            borderRadius: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder:
                                        (context) => AlertDialog(
                                          title: Text('Akkauntni ochirish'),
                                          content: Text(
                                            'Haqiqatan ham akkauntni ochirmoqchimisiz?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed:
                                                  () => Navigator.pop(context),
                                              child: Text('Bekor qilish'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                chiq();
                                                context.go(
                                                  AppRoutesNames.login,
                                                );
                                              },
                                              child: Text('Ochirish'),
                                            ),
                                          ],
                                        ),
                                  );
                                },
                                child: Container(
                                  width: 160,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.backBlackColor,
                                  ),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      SvgPicture.asset(AppImages.delate),
                                      Text(
                                        'Akkauntni o\'chirish',
                                        style: AppTextStyles.s14w400,
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: WGradientContainer(
          onTap: () {
            _saveProfile();
            context.pop();
          },
          height: 50,
          borderRadius: BorderRadius.circular(15),
          colors: [AppColors.darkBlue, AppColors.blue],
          child: Center(
            child: Text(
              'Saqlash',
              style: AppTextStyles.s16w500.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
