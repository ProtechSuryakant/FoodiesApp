import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class PopularItemCard extends StatelessWidget {
  const PopularItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.35,
      width: w * 0.55,
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
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    Text(
                      "4.4",
                      style: AppTextStyles.paragraphStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: h * 0.13,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.pizza_ai1),
                    fit: BoxFit.contain)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: const Text(
              "Chicken Sandwich",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
                color: FoodiesColors.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              "There are many variations of"
              "passage of available, but the"
              "majority have suffer",
              style: AppTextStyles.paragraphStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: const Text(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              "₹ 126.00",
              style: TextStyle(
                fontSize: 16,
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
