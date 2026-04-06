import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/features/place_order/components/custom_container.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [  CustomText(
              text: 'Shipping method'.toUpperCase(),
              color: AppColors.grayScalePlacehoder,
              size: 17,
            ),
            Gap(12),
            CustomContainer(
              title: 'Pickup at store',
              icon: Icons.keyboard_arrow_down_sharp,
              isFree: true,
              onTap: () {},
            ),],
    );
  }
}