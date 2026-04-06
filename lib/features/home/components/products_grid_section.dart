import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:style_haven/core/utils/colors.dart';
import 'package:style_haven/core/constants/custom_text.dart';
import 'package:style_haven/features/checkout/view/check_out.dart';
import 'package:style_haven/models/product_model.dart';

class ProductsGridSection extends StatelessWidget {
  const ProductsGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ProductModel.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        final item = ProductModel.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckOut(
                  image: item.image,
                  name: item.name,
                  description: item.description,
                  price: item.price,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.image),
              Gap(10),
              CustomText(text: item.name),
              CustomText(text: item.description, color: Colors.grey),
              Gap(8),
              CustomText(
                text: '\$ ${item.price.toString()}',
                color: AppColors.priceColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
