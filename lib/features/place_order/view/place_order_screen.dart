import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/colors.dart';
import 'package:style_haven/core/components/cart_section.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_button.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/core/components/total_price.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/features/add_addres/view/add_adress.dart';
import 'package:style_haven/features/add_card/view/add_card.dart';
import 'package:style_haven/features/place_order/components/custom_container.dart';
import 'package:style_haven/features/place_order/components/shipping_adress.dart';
import 'package:style_haven/features/place_order/components/shipping_method.dart';

class PlaceOrderScreen extends StatefulWidget {
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
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  dynamic _saveDataAdress;
  dynamic _saveCard;
  late int totalPrice;
  late int number;
  @override
  void initState() {
    super.initState();
    totalPrice = widget.totalPrice;
  }

  void _openAddres(BuildContext context) async {
    final addressDate = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddAdress(totalPrice: widget.totalPrice),
      ),
    );
    if (addressDate != null) {
      setState(() {
        _saveDataAdress = addressDate;
      });
    }
  }

  void _editAddres() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AddAdress(totalPrice: widget.totalPrice, editData: _saveDataAdress),
      ),
    );
    setState(() {
      _saveDataAdress = newAddress;
    });
  }

  void _openCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddCard()),
    );
    if (cardData != null) {
      setState(() {
        _saveCard = cardData;
      });
    }
  }

  void _editCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddCard(editData: _saveCard)),
    );
    setState(() {
      _saveCard = cardData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackK: false),
      body: Padding(
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
            ShippingAdress(onTap: _editAddres, saveDataAdress: _saveDataAdress),
            _saveDataAdress != null
                ? SizedBox.shrink()
                : Column(
                    children: [
                      CustomContainer(
                        title: 'Add shipping adress',
                        icon: Icons.add,
                        isFree: false,
                        onTap: () {
                          _openAddres(context);
                        },
                      ),
                      Gap(25),
                      ShippingMethod(),
                    ],
                  ),
            Gap(20),
            _saveCard != null
                ? GestureDetector(
                    onTap: _editCard,
                    child: Column(
                      children: [
                        Divider(color: AppColors.grayScalePlacehoder),
                        Gap(15),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.assetsSvgsMastercard),
                            Gap(8),
                            CustomText(
                              text: 'Master Card ending ',
                              color: Color(0xFF17181A),
                            ),
                            CustomText(
                              text:
                                  '••••${_saveCard['cardNumber'].toString().substring(_saveCard['cardNumber'].toString().length - 2)}',
                              color: Color(0xFF17181A),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              Assets.assetsSvgsArrow,
                              height: 25,
                            ),
                          ],
                        ),
                        Gap(15),
                        Divider(color: AppColors.grayScalePlacehoder),
                        Gap(15),
                        CartSection(
                          number: widget.number,
                          image: widget.image,
                          name: widget.name,
                          description: widget.description,
                          price: widget.price.toString(),
                          totalPrice: (v) {
                            totalPrice = v;
                          },
                          onChangedNumber: (value) {
                            setState(() {
                              number = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Payment method'.toUpperCase(),
                        color: AppColors.grayScalePlacehoder,
                        size: 17,
                      ),
                      Gap(15),
                      CustomContainer(
                        title: 'Select payment method',
                        icon: Icons.keyboard_arrow_down_sharp,
                        isFree: false,
                        onTap: _openCard,
                      ),
                    ],
                  ),

            Spacer(),
            TotalPrice(totalPrice: totalPrice, text: 'Total'),
            Gap(20),
            CustomButton(
              isSvg: true,
              text: _saveCard == null && _saveDataAdress == null
                  ? 'Place order'
                  : 'Checkout',
              svg: Assets.assetsSvgsShoppingBag,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.close_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Gap(20),
                            CustomText(
                              text: 'Payment success'.toUpperCase(),
                              size: 20,
                              letterSpacing: 4,
                              color: Colors.black,
                            ),
                            Gap(45),
                            SvgPicture.asset(Assets.assetsPopDone),
                            Gap(40),
                            CustomText(
                              text: 'Your payment was success',
                              color: AppColors.grayScaleBody,
                            ),
                            Gap(8),
                            CustomText(
                              text: 'Payment ID : 1234567890',
                              color: AppColors.grayScaleBody,
                            ),
                            Gap(20),
                            Image.asset(
                              Assets.assetsLine,
                              width: 170,
                              color: AppColors.grayScaleLabel,
                            ),
                            Gap(20),
                            CustomText(
                              text: 'Rate your purchase',
                              color: AppColors.grayScaleBody,
                            ),
                            Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(Assets.assetsPopEmogi1),
                                Gap(10),
                                SvgPicture.asset(Assets.assetsPopEmogi2),
                                Gap(10),
                                SvgPicture.asset(Assets.assetsPopEmogi3),
                              ],
                            ),
                            Gap(50),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    text: 'Submit',
                                    textSize: 16,
                                    svg: Assets.assetsSvgsShoppingBag,
                                    onTap: () {},
                                    isSvg: false,
                                  ),
                                ),
                                Gap(8),
                                Expanded(
                                  child: CustomButton(
                                    color: Colors.white,
                                    text: 'Back to home',
                                    textSize: 16,
                                    textColor: Colors.black,
                                    svg: Assets.assetsSvgsShoppingBag,
                                    onTap: () {},
                                    isSvg: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
