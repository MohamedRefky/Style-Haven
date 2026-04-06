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
    this.width,
    this.color,
    this.textSize,
    this.textColor,
  });
  final String text;
  final String svg;
  final Function() onTap;
  final bool isSvg;
  final double? width;
  final Color? color;
  final double? textSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,

        color: color ?? Colors.black,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg ? SvgPicture.asset(svg) : SizedBox.shrink(),
              isSvg ? Gap(20) : SizedBox.shrink(),
              Flexible(
                child: CustomText(
                  text: text.toUpperCase(),
                  size: textSize ?? 16,
                  color: textColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
