import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/common/const/images_assets.dart';

class FilterTagWidget extends StatelessWidget {
  final String? iconImg;
  final String? name;
  final bool? isSelected;
  final void Function()? onTap;
  const FilterTagWidget({Key? key, this.iconImg, this.name, this.isSelected,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 3.0, left: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isSelected ?? false ? Colors.blueGrey : Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                iconImg ?? '',
                height: 30,
                width: 30,
                color: isSelected ?? false ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 6.0,
                right: 12.0,
              ),
              child: Text(
                name ?? '',
                style: TextStyle(
                  color: isSelected ?? false ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
