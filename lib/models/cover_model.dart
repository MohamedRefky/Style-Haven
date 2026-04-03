import 'package:style_haven/core/constants/constants_assets.dart';

class CoverModel {
  CoverModel({required this.image, required this.name});
  final String image;
  final String name;

  static List<CoverModel> covers = [
    CoverModel(
      image: Assets.assetsCoverCover3,
      name: 'White collection'.toUpperCase(),
    ),
    CoverModel(
      image: Assets.assetsCoverCover1,
      name: 'Black collection'.toUpperCase(),
    ),
    CoverModel(
      image: Assets.assetsCoverCover2,
      name: 'HAE BY HAEKIM'.toUpperCase(),
    ),
  ];
}
