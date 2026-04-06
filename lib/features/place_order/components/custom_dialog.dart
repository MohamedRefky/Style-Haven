import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/components/custom_button.dart'
    show CustomButton;
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 460,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close_outlined, color: Colors.black),
            ),
          ),
          Gap(15),
          CustomText(
            text: 'Payment success'.toUpperCase(),
            size: 20,
            letterSpacing: 4,
            color: Colors.black,
          ),
          Gap(30),
          SvgPicture.asset(
            Assets.assetsPopDone,
            colorFilter: ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
          ),
          Gap(30),
          CustomText(
            text: 'Your payment was success',
            color: AppColors.grayScaleBody,
          ),
          Gap(8),
          CustomText(
            text: 'Payment ID : 1234567890',
            color: AppColors.grayScaleBody,
          ),
          Gap(20),
          Image.asset(
            Assets.assetsLine,
            width: 170,
            color: AppColors.grayScaleLabel,
          ),
          Gap(20),
          CustomText(
            text: 'Rate your purchase',
            color: AppColors.grayScaleBody,
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsPopEmogi1),
              Gap(10),
              SvgPicture.asset(Assets.assetsPopEmogi2),
              Gap(10),
              SvgPicture.asset(Assets.assetsPopEmogi3),
            ],
          ),
          Spacer(),
          Row(
            children: [
              CustomButton(
                width: 140,
                text: 'Submit',
                textSize: 16,
                svg: Assets.assetsSvgsShoppingBag,
                onTap: () {
                  Navigator.pop(context);
                },
                isSvg: false,
              ),
              Gap(8),
              Expanded(
                child: CustomButton(
                  color: Colors.black,
                  text: 'Back to home',
                  textSize: 16,
                  textColor: Colors.white,
                  svg: Assets.assetsSvgsShoppingBag,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  isSvg: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
