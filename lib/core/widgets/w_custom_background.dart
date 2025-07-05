import 'package:flutter/material.dart';

class WCustomBackground extends StatelessWidget {
  final Widget child;
  const WCustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1B223A),
            Color(0xFF151825),
            Color(0xFF151825),
            Color(0xFF151825),
            Color(0xFF151825),
            Color(0xFF1B223A),
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
