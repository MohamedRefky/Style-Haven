import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/cart_section.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_button.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/core/components/total_price.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/features/checkout/widget/promo_widget.dart';
import 'package:style_haven/features/place_order/view/place_order_screen.dart';

class CheckOut extends StatefulWidget {
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
  final int price;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late int totalPrice;
  int number = 1;

  @override
  void initState() {
    totalPrice = widget.price;

    super.initState();
  }

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
                children: [
                  CustomHeader(),
                  Gap(20),
                  CartSection(
                    number: number,
                    image: widget.image,
                    name: widget.name,
                    description: widget.description,
                    price: widget.price.toString(),
                    totalPrice: (value) {
                      setState(() {
                        totalPrice = value;
                      });
                    },
                    onChangedNumber: (value) {
                      setState(() {
                        number = value;
                      });
                    },
                  ),
                  Gap(20),
                  promo(),
                  Spacer(),
                  TotalPrice(totalPrice: totalPrice, text: 'Est. Total'),
                  Gap(20),
                ],
              ),
            ),
          ),
          CustomButton(
            isSvg: true,
            text: 'Checkout',
            svg: Assets.assetsSvgsShoppingBag,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceOrderScreen(
                    image: widget.image,
                    name: widget.name,
                    description: widget.description,
                    price: widget.price,
                    totalPrice: totalPrice,
                    number: number,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
