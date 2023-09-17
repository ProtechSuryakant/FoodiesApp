import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class PopularItemCard extends StatelessWidget {
  final IconData favIcon;
  final IconData ratIcon;
  final double itemRating;
  final double itemPrice;
  final String image;
  final String itemTitle;
  final String itemDetails;
  const PopularItemCard(
      {super.key,
      required this.favIcon,
      required this.ratIcon,
      required this.image,
      required this.itemTitle,
      required this.itemDetails,
      required this.itemRating,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.35.h,
      width: w * 0.55.h,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 0.5))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(favIcon)),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Icon(
                      ratIcon,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    Text(
                      itemRating.toString(),
                      style: AppTextStyles.paragraphStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: h * 0.13.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.pizza_ai1),
                    fit: BoxFit.contain)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Text(
              itemTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
                color: FoodiesColors.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                itemDetails,
                style: AppTextStyles.paragraphStyle,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: Text(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              "₹ $itemPrice",
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
                color: FoodiesColors.accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
