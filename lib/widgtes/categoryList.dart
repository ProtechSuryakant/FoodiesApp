import 'package:flutter/material.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
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
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.30,
      width: w,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 0,
            mainAxisExtent: 80),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const CategoryCard(
              image: AppAssets.burger3, catTitle: "Burger");
        },
      ),
    );
  }
}
