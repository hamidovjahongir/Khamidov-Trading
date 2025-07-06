import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(child: Column(children: [Text("asldkjfl;ak")])),
    );
  }
}
