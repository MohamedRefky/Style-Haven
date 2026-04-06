import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_button.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/core/components/total_price.dart';
import 'package:style_haven/core/constants/constants_assets.dart';
import 'package:style_haven/features/add_addres/components/custom_text_form_fild.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key, required this.totalPrice, this.editData});
  final int totalPrice;
  final dynamic editData;
  @override
  State<AddAdress> createState() => _AddAdressState();
}

final _formKey = GlobalKey<FormState>();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final adressController = TextEditingController();
final cityController = TextEditingController();
final phoneNamberController = TextEditingController();
final stateController = TextEditingController();
final zipCodeController = TextEditingController();

@override
void dispose() {
  firstNameController.dispose();
  lastNameController.dispose();
  adressController.dispose();
  cityController.dispose();
  phoneNamberController.dispose();
  stateController.dispose();
  zipCodeController.dispose();
}

@override
void initState(dynamic widget) {
  if (widget.editData != null) {
    firstNameController.text = widget.editData['firstName'];
    lastNameController.text = widget.editData['lastName'];
    adressController.text = widget.editData['adress'];
    cityController.text = widget.editData['city'];
    phoneNamberController.text = widget.editData['phoneNamber'];
    stateController.text = widget.editData['state'];
    zipCodeController.text = widget.editData['zipCode'];
  }
}

final class _AddAdressState extends State<AddAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackK: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomHeader(
                  text: 'Add shipping adress'.toUpperCase(),
                  size: 24,
                  letterSpacing: 3,
                ),
                Gap(35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormFild(
                      text: 'First Name',
                      width: 180,
                      controller: firstNameController,
                    ),
                    CustomTextFormFild(
                      text: 'Last Name',
                      width: 180,
                      controller: lastNameController,
                    ),
                  ],
                ),
                Gap(20),
                CustomTextFormFild(
                  text: 'Address',
                  controller: adressController,
                ),
                Gap(20),
                CustomTextFormFild(text: 'City', controller: cityController),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormFild(
                      text: 'State',
                      width: 180,
                      controller: stateController,
                    ),
                    CustomTextFormFild(
                      text: 'ZIP Code',
                      width: 180,
                      controller: zipCodeController,
                    ),
                  ],
                ),
                Gap(20),
                CustomTextFormFild(
                  text: 'Phone Number',
                  controller: phoneNamberController,
                ),
                Gap(MediaQuery.of(context).size.height * 0.28),
                TotalPrice(text: 'Total', totalPrice: widget.totalPrice),
                Gap(18),
                CustomButton(
                  isSvg: false,
                  text: 'Add now',
                  svg: Assets.assetsSvgsShoppingBag,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final data = {
                        'firstName': firstNameController.text,
                        'lastName': lastNameController.text,
                        'address': adressController.text,
                        'city': cityController.text,
                        'state': stateController.text,
                        'zipCode': zipCodeController.text,
                        'phoneNamber': phoneNamberController.text,
                      };
                      Navigator.pop(context, data);
                    } else {
                      return;
                    }
                  },
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
