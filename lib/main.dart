import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/dio_client/dio_client.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/routes/router.dart';
import 'package:trading_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trading_app/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trading_app/features/auth/presentation/cubits/forget_password_cubit.dart';
import 'package:trading_app/features/profile/data/repository/user_local_repository.dart';
import 'package:trading_app/features/profile/data/repository/user_repository_impl.dart';
import 'package:trading_app/features/profile/domain/repository/user_repository.dart';
import 'package:trading_app/features/profile/presentation/bloc/user_bloc.dart';
import 'firebase_options.dart';

final dioClient = DioClient();
final UserRepository userRepository = UserRepositoryImpl(dioClient);
final UserLocalRepository userLocalRepository = UserLocalRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserBloc(userRepository, userLocalRepository),
        ),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => ToggleCubit()),
        BlocProvider(create: (_) => PasswordVisibilityCubit()),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
