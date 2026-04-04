import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/components/custom_appbar.dart';
import 'package:style_haven/core/components/custom_header.dart';
import 'package:style_haven/features/add_addres/components/custom_text_form_fild.dart';

class AddAdress extends StatelessWidget {
  const AddAdress({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppBar(isBlackK: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomHeader(text: 'Add shipping adress'.toUpperCase(), size: 22),
            Gap(35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormFild(
                  text: 'First name',
                  width: 180,
                  controller: TextEditingController(),
                ),
                CustomTextFormFild(
                  text: 'Last name',
                  width: 180,
                  controller: TextEditingController(),
                ),
              ],
            ),
            Gap(20),
            CustomTextFormFild(
              text: 'Address',
              controller: TextEditingController(),
            ),
            Gap(20),
            CustomTextFormFild(
              text: 'City',
              controller: TextEditingController(),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormFild(
                  text: 'State',
                  width: 180,
                  controller: TextEditingController(),
                ),
                CustomTextFormFild(
                  text: 'ZIP code',
                  width: 180,
                  controller: TextEditingController(),
                ),
              ],
            ),
            Gap(20),
            CustomTextFormFild(
              text: 'Phone number',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
