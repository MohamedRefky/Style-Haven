import 'package:flutter/material.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice, required this.text});
  final int totalPrice;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text.toUpperCase(),
          color: AppColors.grayScaleBody,
          size: 20,
        ),
        CustomText(
          text: '\$$totalPrice',
          color: AppColors.priceColor,
          size: 20,
        ),
      ],
    );
  }
}
