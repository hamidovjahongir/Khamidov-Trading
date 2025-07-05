import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:trading_app/features/auth/presentation/pages/login_screen.dart';
import 'package:trading_app/features/auth/presentation/pages/register_screen.dart';
import 'package:trading_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:trading_app/features/course/presentation/pages/course_screen.dart';
import 'package:trading_app/features/documentation/presentation/screens/documentation_screen.dart';
import 'package:trading_app/features/home/presentation/page/home_screen.dart';
import 'package:trading_app/features/payment/presentation/pages/payment_screen.dart';
import 'package:trading_app/features/premium/presentation/pages/premium_video_screen.dart';
import 'package:trading_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:trading_app/features/main_screen.dart';

/// GoRouter konfiguratsiyasi
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutesNames.documentation,
  debugLogDiagnostics: true,

  // Redirect funksiyasi - Foydalanuvchi holatini tekshirish uchun
  // redirect: (BuildContext context, GoRouterState state) {
  //   // Bu yerda authentication logikangizni yozing
  //   // Masalan: agar user login qilmagan bo'lsa, login sahifasiga yo'naltirish

  //   final bool isLoggedIn = false; // Bu yerda real authentication holatini tekshiring
  //   final String currentPath = state.fullPath ?? '';

  //   // Agar splash screen'da bo'lsa
  //   if (currentPath == AppRoutesNames.splash) {
  //     return null; // Splash screen'ni ko'rsatish
  //   }

  //   // Agar login qilinmagan bo'lsa va auth route'da emas bo'lsa
  //   if (!isLoggedIn && !_isAuthRoute(currentPath)) {
  //     return AppRoutesNames.login;
  //   }

  //   // Agar login qilingan bo'lsa va auth route'da bo'lsa
  //   if (isLoggedIn && _isAuthRoute(currentPath)) {
  //     return AppRoutesNames.home;
  //   }

  //   return null; // Redirect qilmaslik
  // },
  routes: [
    // 🔰 SPLASH SCREEN
    GoRoute(
      path: AppRoutesNames.splash,
      name: AppRoutesNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // 🔐 AUTHENTICATION ROUTES
    GoRoute(
      path: AppRoutesNames.login,
      name: AppRoutesNames.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.register,
      name: AppRoutesNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: AppRoutesNames.forgetPassword,
      name: AppRoutesNames.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutesNames.documentation,
      name: AppRoutesNames.documentation,
      builder: (context, state) => const DocumentationScreen(),
    ),

    // ✅ MAIN SHELL ROUTE (Bottom Navigation)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        //keyin uchirilsin
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: AppRoutesNames.documentation,
        //       name: AppRoutesNames.documentation,
        //       builder: (context, state) => const DocumentationScreen(),
        //       routes: [
        //         // Bu yerda home ichidagi sub-routes qo'shishingiz mumkin
        //         // Masalan: home/profile, home/settings va h.k.
        //       ],
        //     ),
        //   ],
        // ),

        // 🏠 HOME BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.home,
              name: AppRoutesNames.home,
              builder: (context, state) => const HomeScreen(),
              routes: [
                // Bu yerda home ichidagi sub-routes qo'shishingiz mumkin
                // Masalan: home/profile, home/settings va h.k.
              ],
            ),
          ],
        ),

        // 🔥 PREMIUM VIDEO BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.premiumVideo,
              name: AppRoutesNames.premiumVideo,
              builder: (context, state) => const VideoLessonScreen(),
              routes: [
                // Premium video ichidagi sub-routes
              ],
            ),
          ],
        ),

        // 📚 COURSE BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.course,
              name: AppRoutesNames.course,
              builder: (context, state) => const CourseScreen(),
              routes: [
                // Course ichidagi sub-routes
              ],
            ),
          ],
        ),

        // 💳 PAYMENT BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.payment,
              name: AppRoutesNames.payment,
              builder: (context, state) => const PaymentScreen(),
              routes: [
                // Payment ichidagi sub-routes
              ],
            ),
          ],
        ),

        // 👤 PROFILE BRANCH
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesNames.profile,
              name: AppRoutesNames.profile,
              builder: (context, state) => const ProfileScreen(),
              routes: [
                // Profile ichidagi sub-routes
              ],
            ),
          ],
        ),
      ],
    ),
  ],

  // Error sahifasi
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Sahifa topilmadi!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Path: ${state.fullPath}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(AppRoutesNames.home),
                child: const Text('Bosh sahifaga qaytish'),
              ),
            ],
          ),
        ),
      ),
);

// bool _isAuthRoute(String path) {
//   const authRoutes = [
//     AppRoutesNames.login,
//     AppRoutesNames.register,
//     AppRoutesNames.forgetPassword,
//   ];

//   return authRoutes.any((route) => path.startsWith(route));
// }

// Navigation helper funksiyalari
extension AppRouterExtension on BuildContext {
  // Go to route
  void goToRoute(String route) => go(route);

  // Push route
  void pushRoute(String route) => push(route);

  // Replace route
  void replaceRoute(String route) => pushReplacement(route);

  // Go back
  void goBack() => pop();

  // Go to home
  void goToHome() => go(AppRoutesNames.home);

  // Go to login
  void goToLogin() => goNamed(AppRoutesNames.login);

  // Go to register
  void goToRegister() => go(AppRoutesNames.register);
}
