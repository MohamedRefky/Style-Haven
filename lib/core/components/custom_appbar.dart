import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/utils/colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.isBlackK});
  @override
  Size get preferredSize => const Size.fromHeight(80);
  bool isBlackK;
  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackK;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        centerTitle: true,
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        leadingWidth: 28,
        leading: SvgPicture.asset(
          Assets.assetsSvgsMenu,
          colorFilter: ColorFilter.mode(
            isBlack ? Colors.white : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        title: SvgPicture.asset(
          Assets.assetsStyleHaven,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.2,
          colorFilter: ColorFilter.mode(
            isBlack ? Colors.white : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        actions: [
          SvgPicture.asset(
            Assets.assetsSvgsSearch,
            colorFilter: ColorFilter.mode(
              isBlack ? Colors.white : AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          Gap(10),
          SvgPicture.asset(
            Assets.assetsSvgsShoppingBag,
            colorFilter: ColorFilter.mode(
              isBlack ? Colors.white : AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
