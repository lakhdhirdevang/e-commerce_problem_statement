import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/features/data/models/item_list_data_model.dart';

import '../../../common/const/images_assets.dart';

class ItemListWidget extends StatelessWidget {
  final ItemListData? itemListData;
  final void Function()? onTap;
  final void Function()? onTapLikeDislike;
  final bool? isLikeDisLike;
  const ItemListWidget(
      {Key? key,
      this.itemListData,
      this.onTap,
      this.onTapLikeDislike,
      this.isLikeDisLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        height: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(itemListData?.img ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.black38.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemListData?.name ?? '',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\u{20B9}${itemListData?.prize ?? ''}',
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: onTapLikeDislike,
                        child: SvgPicture.asset(
                          itemListData?.isLike??false
                              ? AssetsImages.icLike
                              : AssetsImages.icDisLike,
                          height: 20,
                          width: 20,
                          color: itemListData?.isLike??false
                              ?Colors.red:Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
