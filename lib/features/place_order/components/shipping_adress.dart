import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class ShippingAdress extends StatelessWidget {
  const ShippingAdress({
    super.key,
    this.saveDataAdress,
    required this.onTap,
  });
  final dynamic saveDataAdress;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: GestureDetector(
        onTap: () => onTap(),
        child: saveDataAdress == null
            ? SizedBox.shrink()
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            '${saveDataAdress['firstName']} ${saveDataAdress['lastName']}  ',
                        color: Color(0xFF1A1A1A),
                      ),
                      Gap(8),
                      CustomText(
                        text:
                            '${saveDataAdress['address']}, ${saveDataAdress['city']}  ',
                        color: AppColors.grayScaleLabel,
                      ),
                      Gap(8),
                      CustomText(
                        text: 'phone: ${saveDataAdress['phoneNamber']}',
                        color: AppColors.grayScaleLabel,
                      ),
                      Gap(8),
                      CustomText(
                        text:
                            'State: ${saveDataAdress['state']} ${saveDataAdress['zipCode']}',
                        color: AppColors.grayScaleLabel,
                      ),
                    ],
                  ),
                  Spacer(),
                       SvgPicture.asset(Assets.assetsSvgsArrow, width: 28),
                ],
              ),
      ),
    );
  }
}
