import '../../../common/const/images_assets.dart';
import '../../../common/const/string_assets.dart';

class ItemListData {
  final String? img;
  final String? name;
  final String? desc;
  final String? prize;
  final int? rating;
  bool? isLike;

  ItemListData(
      {this.img,
      this.name,
      this.desc,
      this.prize,
      this.isLike = false,
      this.rating});

  static List<ItemListData> foodListData() {
    return [
      ItemListData(
          img: AssetsImages.food1,
          name: food1,
          desc: descFood1,
          prize: prize2,
          isLike: false,
          rating: 4),
      ItemListData(
          img: AssetsImages.food2,
          name: food2,
          desc: descFood2,
          prize: prize1,
          isLike: false,
          rating: 3),
      ItemListData(
          img: AssetsImages.food3,
          name: food3,
          desc: descFood3,
          prize: prize3,
          isLike: false,
          rating: 3),
      ItemListData(
          img: AssetsImages.food4,
          name: food4,
          desc: descFood4,
          prize: prize4,
          isLike: false,
          rating: 5),
      ItemListData(
          img: AssetsImages.food2,
          name: food2,
          desc: descFood2,
          prize: prize1,
          isLike: false,
          rating: 3),
    ];
  }

  static List<ItemListData> drinkListData() {
    return [
      ItemListData(
          img: AssetsImages.drink1,
          name: drink1,
          desc: descDrink1,
          prize: prize1,
          isLike: false,
          rating: 5),
      ItemListData(
          img: AssetsImages.drink2,
          name: drink2,
          desc: descDrink2,
          prize: prize3,
          isLike: false,
          rating: 3),
      ItemListData(
          img: AssetsImages.drink3,
          name: drink3,
          desc: descDrink3,
          prize: prize5,
          isLike: false,
          rating: 4),
      ItemListData(
          img: AssetsImages.drink4,
          name: drink4,
          desc: descDrink4,
          prize: prize2,
          isLike: false,
          rating: 2),
      ItemListData(
          img: AssetsImages.drink2,
          name: drink2,
          desc: descDrink2,
          prize: prize3,
          isLike: false,
          rating: 3),
      ItemListData(
          img: AssetsImages.drink1,
          name: drink1,
          desc: descDrink1,
          prize: prize1,
          isLike: false,
          rating: 5),
    ];
  }

  static List<ItemListData> fruitListData() {
    return [
      ItemListData(
          img: AssetsImages.fruit1,
          name: fruit1,
          desc: descFruit1,
          prize: prize3,
          isLike: false,
          rating: 4),
      ItemListData(
          img: AssetsImages.fruit2,
          name: fruit2,
          desc: descFruit2,
          prize: prize2,
          isLike: false,
          rating: 5),
      ItemListData(
          img: AssetsImages.fruit3,
          name: fruit3,
          desc: descFruit3,
          prize: prize1,
          isLike: false,
          rating: 5),
      ItemListData(
          img: AssetsImages.fruit4,
          name: fruit4,
          desc: descFruit4,
          prize: prize1,
          isLike: false,
          rating: 4),
      ItemListData(
          img: AssetsImages.fruit1,
          name: fruit1,
          desc: descFruit1,
          prize: prize3,
          isLike: false,
          rating: 4),
    ];
  }
}
