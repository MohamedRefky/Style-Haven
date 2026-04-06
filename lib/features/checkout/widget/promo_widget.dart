import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

Widget promo() {
  return Column(
    children: [
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsSvgsPromo, height: 25),
            Gap(12),
            CustomText(
              text: 'Add promo code',
              size: 20,
              color: AppColors.grayScaleBody,
            ),
          ],
        ),
      ),
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsSvgsDelivery, width: 28),
            Gap(12),
            CustomText(
              text: 'Delivery',
              size: 20,
              color: AppColors.grayScaleBody,
            ),
            Spacer(),
            CustomText(text: 'Free', size: 20, color: AppColors.grayScaleBody),
          ],
        ),
      ),
      Divider(),
    ],
  );
}