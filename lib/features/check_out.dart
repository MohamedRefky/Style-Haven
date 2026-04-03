import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
  final String image;
  final String name;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackK: false),
      body: Column(
        children: [
          Gap(18),
          Center(
            child: CustomText(
              text: 'Checkout'.toUpperCase(),
              color: Colors.black,
              size: 26,
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
