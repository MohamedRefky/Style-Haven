import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/models/cover_model.dart';


class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CoverModel.covers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = CoverModel.covers[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item.image, height: 320, fit: BoxFit.cover),
                Gap(13),
                CustomText(text: item.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
