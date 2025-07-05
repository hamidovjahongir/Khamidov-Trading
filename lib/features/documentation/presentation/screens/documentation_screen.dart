import 'package:flutter/material.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [Container()]),
        ),
      ),
    );
  }
}
