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
      padding: EdgeInsets.only(top: 10.h),
      child: Column(children: [
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: Image.asset(image),
        ),
        Text(
          catTitle,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inder',
            color: FoodiesColors.textColor,
          ),
        )
      ]),
    );
  }
}
