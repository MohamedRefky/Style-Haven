import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.svg,
    required this.onTap,
    required this.isSvg,
  });
  final String text;
  final String svg;
  final Function() onTap;
  final bool isSvg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg ? SvgPicture.asset(svg) : const Gap(0),
              Gap(20),
              CustomText(text: text.toUpperCase(), size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
