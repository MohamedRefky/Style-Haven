import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
     this.color = Colors.white,
     this.size = 16,
     this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "Tener Sans",
        color: color,
      ),
    );
  }
}
