import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/data/models/categoryDataModal.dart';
import 'package:foodies_app/utils/categoryCard.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 200.h,
      width: w.w,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            mainAxisExtent: 90.w),
        shrinkWrap: false,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
              image: categoryData[index].image,
              catTitle: categoryData[index].categoryTitle);
        },
      ),
    );
  }
}
