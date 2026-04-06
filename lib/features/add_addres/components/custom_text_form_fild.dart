import 'package:flutter/material.dart';
import 'package:style_haven/core/constants/custom_text.dart';

class CustomTextFormFild extends StatelessWidget {
  const CustomTextFormFild({
    super.key,
    required this.text,
    this.width,
    required this.controller,
  });
  final String text;
  final double? width;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter yuor data';
          }
          return null;
        },
        controller: controller,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hint: CustomText(text: text, color: Color(0xFF979797), size: 17),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
