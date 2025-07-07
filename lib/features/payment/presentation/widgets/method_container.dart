import 'package:flutter/material.dart';

class MethodContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final bool selected;

  const MethodContainer({
    Key? key,
    required this.imagePath,
    required this.name,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFF0F111C),
        borderRadius: BorderRadius.circular(20),
        border:
            selected
                ? Border.all(color: Colors.blue, width: 2)
                : Border.all(color: Colors.transparent),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 83, width: 83, child: Image.asset(imagePath)),
            Spacer(),
            Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1C1F2A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
