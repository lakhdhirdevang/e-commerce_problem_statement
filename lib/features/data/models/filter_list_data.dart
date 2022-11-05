import 'package:untitled/common/const/images_assets.dart';

import '../../../common/const/string_assets.dart';

class FilterListData {
  final String icon;
  final String name;
  bool isSelected;

  FilterListData(
      {required this.icon, required this.name, required this.isSelected});

  static List<FilterListData> filterTagOptionData() {
    return [
      FilterListData(icon: AssetsImages.icFood, name: food, isSelected: true),
      FilterListData(
          icon: AssetsImages.icDrink, name: drink, isSelected: false),
      FilterListData(
          icon: AssetsImages.icFruits, name: fruits, isSelected: false),
    ];
  }
}
