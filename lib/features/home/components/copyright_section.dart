import 'package:flutter/material.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff555555),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: CustomText(
          text: 'Copyright© OpenUI All Rights Reserved.',
          size: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
