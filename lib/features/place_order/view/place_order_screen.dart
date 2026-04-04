import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_button.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/core/components/total_price.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/features/add_addres/view/add_adress.dart';
import 'package:style_haven/features/place_order/components/custom_container.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.totalPrice,
    required this.number,
  });
  final String name, description, image;
  final int price;
  final int totalPrice;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackK: false),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(),
                  Gap(20),
                  CustomText(
                    text: 'Shipping adress'.toUpperCase(),
                    color: AppColors.grayScalePlacehoder,
                    size: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 18,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAdress(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: name, color: Color(0xFF1A1A1A)),
                              Gap(5),
                              CustomText(
                                text: description,
                                color: AppColors.grayScaleLabel,
                              ),
                              Gap(5),
                              CustomText(
                                text: description,
                                color: AppColors.grayScaleLabel,
                              ),
                              Gap(5),
                              CustomText(
                                text: description,
                                color: AppColors.grayScaleLabel,
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grayScaleLabel,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(8),
                  CustomContainer(
                    title: 'Add shipping adress',
                    icon: Icons.add,
                    isFree: false,
                    onTap: () {},
                  ),
                  Gap(40),
                  CustomText(
                    text: 'Shipping adress'.toUpperCase(),
                    color: AppColors.grayScalePlacehoder,
                    size: 17,
                  ),
                  Gap(12),
                  CustomContainer(
                    title: 'Pickup at store',
                    icon: Icons.keyboard_arrow_down_sharp,
                    isFree: true,
                    onTap: () {},
                  ),
                  Gap(40),
                  CustomText(
                    text: 'Payment method'.toUpperCase(),
                    color: AppColors.grayScalePlacehoder,
                    size: 17,
                  ),
                  Gap(12),
                  CustomContainer(
                    title: 'Select payment method',
                    icon: Icons.keyboard_arrow_down_sharp,
                    isFree: false,
                    onTap: () {},
                  ),
                  Spacer(),
                  TotalPrice(totalPrice: totalPrice, text: 'Total'),
                  Gap(20),
                ],
              ),
            ),
          ),
          CustomButton(
            isSvg: true,
            text: 'Place order',
            svg: Assets.assetsSvgsShoppingBag,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PlaceOrderScreen(
              //       image: image,
              //       name: name,
              //       description: description,
              //       price: price,
              //       totalPrice: totalPrice,
              //       number: number,
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
