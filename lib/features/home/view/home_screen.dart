import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/features/home/components/about_section.dart';
import 'package:style_haven/features/home/components/copyright_section.dart';
import 'package:style_haven/features/home/components/cover_section.dart';
import 'package:style_haven/features/home/components/products_grid_section.dart';
import 'package:style_haven/features/home/components/you_may_also_like_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Gap(135),
                        Image.asset(Assets.assetsCoverCover1),
                        Gap(28),
                        ProductsGridSection(),
                        YouMayAlsoLikeSection(),
                        CoverSection(),
                        AboutSection(),
                      ],
                    ),
                  ),
                  CopyrightSection(),
                ],
              ),
            ),
          ],
        ),
      );
  }
}