import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
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
import 'package:style_haven/features/place_order/components/custom_dialog.dart';
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
                      child: CustomDialog(),
                    );
                  },
                );
              },
            ),
            Gap(15),
          ],
        ),
      ),
    );
  }
}
