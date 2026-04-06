import 'package:flutter/material.dart';
import 'package:style_haven/core/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.size = 16,
    this.fontWeight = FontWeight.normal,
    this.max = 1,
    this.height = 1,
    this.letterSpacing = 1,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final int max;
  final double height;
  final double letterSpacing;

  @override

  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "Tener Sans",
        color: color,
        overflow: TextOverflow.ellipsis,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
