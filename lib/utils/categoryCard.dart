import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String catTitle;

  const CategoryCard({super.key, required this.image, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        SizedBox(
          height: 60.h,
          width: 60.h,
          child: Image.asset(image),
        ),
        Text(
          catTitle,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Inder',
            color: FoodiesColors.textColor,
          ),
        )
      ]),
    );
  }
}
