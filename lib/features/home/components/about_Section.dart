import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_twitter, color: AppColors.white),
            Gap(35),
            Icon(Ionicons.logo_instagram, color: AppColors.white),
            Gap(35),
            Icon(Ionicons.logo_facebook, color: AppColors.white),
          ],
        ),
        Gap(20),
        Image.asset(Assets.assetsLine, width: 170),
        Gap(20),
        CustomText(
          text:
              'support@openui.design\n      +60 825 876\n08:00 - 22:00 - Everyday',
          max: 3,
          height: 2.5,
        ),
        Gap(20),
        Image.asset(Assets.assetsLine, width: 170),
        Gap(20),
        CustomText(text: 'AboutSection            Contact            Blog'),
        Gap(30),
      ],
    );
  }
}
