import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class YouMayAlsoLikeSection extends StatelessWidget {
  const YouMayAlsoLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(25),
        CustomText(
          text: 'You may also like'.toUpperCase(),
          size: 26,
          color: AppColors.white,
        ),
        Gap(10),
        Image.asset(Assets.assetsLine, color: AppColors.white, width: 190),
        Gap(30),
      ],
    );
  }
}
