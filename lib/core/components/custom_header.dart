import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, this.text, this.size});
  final String? text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(18),
        Center(
          child: CustomText(
            text: text ?? 'Checkout'.toUpperCase(),
            color: Colors.black,
            size: size ?? 26,
            letterSpacing: 4,
          ),
        ),
        Gap(10),
        Image.asset(Assets.assetsLine, width: 190, color: Colors.black),
      ],
    );
  }
}
