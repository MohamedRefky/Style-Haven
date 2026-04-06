import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CartSection extends StatefulWidget {
  const CartSection({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.totalPrice,
    required this.onChangedNumber,
    required this.number,
  });
  final String image, name, description, price;
  final int number;
  final Function(int) totalPrice;
  final Function(int) onChangedNumber;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = 1;
    number = widget.number;
   
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset(widget.image, width: 110, fit: BoxFit.cover),
        Gap(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(6),
            CustomText(
              text: widget.name.toUpperCase(),
              color: Colors.black,
              letterSpacing: 2,
              size: 17,
            ),
            Gap(8),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: widget.description,
                color: AppColors.grayScaleLabel,
                size: 13,
              ),
            ),
            Gap(15),
            Row(
              children: [
                counter(() {
                  setState(() {
                    if (number > 1) {
                      number--;
                      final totalPrice = number * int.parse(widget.price);
                      widget.totalPrice(totalPrice);
                    }
                  });
                }, Assets.assetsSvgsMin),
                Gap(10),
                CustomText(
                  text: number.toString(),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                Gap(10),
                counter(() {
                  setState(() {
                    number++;
                    final totalPrice = number * int.parse(widget.price);
                    widget.totalPrice(totalPrice);
                    widget.onChangedNumber(number);
                  });
                }, Assets.assetsSvgsPlus),
              ],
            ),
            Gap(30),
            CustomText(
              text: '\$${widget.price}',
              color: AppColors.priceColor,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}

Widget counter(dynamic onTap, svg) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFC4C4C4), width: 1),
      ),
      child: SvgPicture.asset(svg, height: 20),
    ),
  );
}
