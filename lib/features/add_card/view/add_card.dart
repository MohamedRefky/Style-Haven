import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_button.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/core/constants/constants_assets.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key, this.editData});
  final dynamic editData;
  @override
  State<AddCard> createState() => _AddCardState();
}

final _formKey = GlobalKey<FormState>();
String cardNumber = '';
String expiryDate = '';
String cardHolderName = '';
String cvvCode = '';
bool isShow = false;
dynamic editData;

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(isBlackK: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CustomHeader(text: 'Payment method'.toUpperCase()),
                Gap(10),
                CreditCardWidget(
                  cardBgColor: Colors.black,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  obscureCardCvv: false,
                  isHolderNameVisible: true,
                  onCreditCardWidgetChange: (v) {},
                ),
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  isCardHolderNameUpperCase: true,
                  onCreditCardModelChange: (CreditCardModel data) {
                    setState(() {
                      cardNumber = data.cardNumber;
                      expiryDate = data.expiryDate;
                      cardHolderName = data.cardHolderName;
                      cvvCode = data.cvvCode;
                      isShow = data.isCvvFocused;
                    });
                  },
                  formKey: _formKey,
                ),
                Gap(MediaQuery.of(context).size.height * 0.15),
                CustomButton(
                  isSvg: false,
                  text: 'Add card',
                  svg: Assets.assetsSvgsShoppingBag,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final data = {
                        'cardNumber': cardNumber,
                        'expiryDate': expiryDate,
                        'cardHolderName': cardHolderName,
                        'cvvCode': cvvCode,
                      };
                      Navigator.pop(context, data);
                    }
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
