import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/utils/menuCard.dart';

class MenuCardList extends StatelessWidget {
  const MenuCardList({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      height: h * 0.33.h,
      width: w.h,
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MenuCard(
            image: AppAssets.sushi1,
            categoryTitle: 'Tasty Sushi',
            categoryDetails: "There are many variations of"
                "passage of available, but the"
                "majority have suffer",
            function: () {
              print("Clicked");
            },
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          MenuCard(
            image: AppAssets.popcorn,
            categoryTitle: 'French fries',
            categoryDetails: "There are many variations of"
                "passage of available, but the"
                "majority have suffer",
            function: () {
              print("Clicked");
            },
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          MenuCard(
            image: AppAssets.seak1,
            categoryTitle: 'Hot Barbecue',
            categoryDetails: "There are many variations of"
                "passage of available, but the"
                "majority have suffer",
            function: () {
              print("Clicked");
            },
          ),
        ],
      ),
    );
  }
}
