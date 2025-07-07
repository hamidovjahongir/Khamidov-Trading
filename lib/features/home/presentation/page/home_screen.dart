import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';
import 'package:trading_app/features/home/presentation/bloc/post_bloc.dart';
import 'package:trading_app/features/home/presentation/widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(GetPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backBlackColor,
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          print('Current state: ${state.runtimeType}');

          if (state is PostSuccess) {
            print('Posts count: ${state.posts.length}');
            for (var post in state.posts) {
              print('Post: ${post.toString()}');
            }

            return ListView(
              children: [
                WCustomBackground(
                  child: Column(
                    children: [
                      20.height,
                      Image.asset(AppImages.bannerAcademy),
                      30.height,
                      if (state.posts.isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Hech qanday post topilmadi',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      else
                        ...state.posts
                            .map((post) => HomeWidget(data: post))
                            .toList(),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state is PostLoading) {
            print('Loading posts...');
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostFailure) {
            print('Error loading posts: ${state.message}');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Xatolik yuz berdi',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    state.message,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostBloc>().add(GetPosts());
                    },
                    child: Text('Qayta urinish'),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text(
              'Boshlang\'ich holat',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
