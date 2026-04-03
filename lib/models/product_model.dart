import 'package:style_haven/core/constants/constants_assets.dart';

class ProductModel {
  final String image;
  final String name;
  final int price;
  final String description;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  static List<ProductModel> products = [
    ProductModel(
      image: Assets.assetsProductProduct1,
      name: "October",
      price: 110,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: Assets.assetsProductProduct6,
      name: "October",
      price: 300,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: Assets.assetsProductProduct2,
      name: "October",
      price: 100,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: Assets.assetsProductProduct3,
      name: "October",
      price: 40,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: Assets.assetsProductProduct4,
      name: "October",
      price: 120,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: Assets.assetsProductProduct5,
      name: "October",
      price: 200,
      description: "reversible angora cardigan",
    ),
  ];
}
