// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/constants/app_images.dart';

// class ProfileItems extends StatefulWidget {
//   final bool isAccount;
//   final int index;
//   const ProfileItems({super.key, required this.index, this.isAccount = false});

//   @override
//   State<ProfileItems> createState() => _ProfileItemsState();
// }

// class _ProfileItemsState extends State<ProfileItems> {
//   bool isSwitch = true;
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> items = [
//       {
//         'icon': AppImages.  ,
//         'title': 'Account',
//         'onTap': () {
//           AppRouter.pushNamed(context, AppRouter.account);
//         },
//       },
//       {'icon': AppImages.push, 'title': 'Push Notifications', 'onTap': () {}},
//       {
//         'icon': AppImages.about,
//         'title': 'Terms & Conditions',
//         'onTap': () {
//           AppRouter.pushNamed(context, AppRouter.terms);
//         },
//       },
//       {
//         'icon': AppImages.about,
//         'title': 'About',
//         'onTap': () {
//           AppRouter.pushNamed(context, AppRouter.about);
//         },
//       },
//       {
//         'icon': AppImages.logOut,
//         'title': 'Log Out',
//         'onTap': () {
//           AppRouter.pushNamed(context, AppRouter.login);
//         },
//       },
//       {
//         'icon': AppImages.lock,
//         'title': 'Change Password',
//         'onTap': () {
//           debugPrint('Log Out tapped');
//         },
//       },
//       {
//         'icon': AppImages.mail,
//         'title': 'email@email.com',
//         'onTap': () {
//           debugPrint('Log Out tapped');
//         },
//       },
//     ];
//     final item = items[widget.index];
//     return InkWell(
//       onTap: item["onTap"],
//       child: Container(
//         width: double.infinity,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     spacing: 10,
//                     children: [
//                       SvgPicture.asset(
//                         item["icon"],
//                         width: 16,
//                         height: 16,
//                         fit: BoxFit.cover,
//                       ),
//                       Text(item["title"], style: AppTextStyles.bodySmallMedium),
//                     ],
//                   ),
//                   if (widget.index == 1)
//                     FlutterSwitch(
//                       activeColor: Colors.black,
//                       height: 20,
//                       width: 32,
//                       value: isSwitch,
//                       onToggle: (val) {
//                         setState(() {
//                           isSwitch = val;
//                         });
//                       },
//                       toggleSize: 13.0,
//                     )
//                   else if (widget.index == 4)
//                     const SizedBox.shrink()
//                   else
//                     SvgPicture.asset(
//                       AppImages.next,
//                       width: 24,
//                       height: 24,
//                       fit: BoxFit.cover,
//                     ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 clipBehavior: Clip.none,
//                 width: MediaQuery.of(context).size.width * 0.90,
//                 color: AppColors.lightGrey,
//                 height: 1,
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
