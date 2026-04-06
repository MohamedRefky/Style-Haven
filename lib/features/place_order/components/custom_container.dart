import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.isFree, required this.onTap,
  });
  final String title;
  final IconData icon;
  final bool isFree;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          child: Row(
            children: [
              CustomText(
                text: title,
                color: AppColors.grayScaleLabel,
                size: 17,
              ),
              Spacer(),
              isFree
                  ? Row(
                      children: [
                        CustomText(
                          text: 'FREE',
                          color: AppColors.grayScaleBody,
                          size: 17,
                        ),
                      ],
                    )
                  : Gap(0),
              Gap(10),
              Icon(icon, color: AppColors.grayScaleBody ,size: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
