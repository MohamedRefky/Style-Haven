import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/components/custom_appbar.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/models/product_model.dart';

import 'core/constants/constants_assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(isBlackK: true),
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 150,
                width: 150,
                child: SvgPicture.asset(Assets.assetsTexts10),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 45,
                width: 45,
                child: SvgPicture.asset(Assets.assetsTextsOctober),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 15,
                width: 15,
                child: SvgPicture.asset(Assets.assetsTextsCollection),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Gap(135),
                  Image.asset(Assets.assetsCoverCover1),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProductModel.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(Assets.assetsCoverCover1),
                          CustomText(text: 'October '),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
