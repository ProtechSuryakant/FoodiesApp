import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String categoryTitle;
  final String categoryDetails;
  final VoidCallback? function;
  const MenuCard(
      {super.key,
      required this.image,
      required this.categoryTitle,
      required this.categoryDetails,
      required this.function});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20.0.h,
          ),
          Column(
            children: [
              SizedBox(
                width: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: 70.h,
                  width: 70.h,
                ),
              ),
              Text(
                categoryTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder',
                  color: FoodiesColors.textColor,
                ),
              ),
              SizedBox(
                width: 165.h,
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  categoryDetails,
                  style: AppTextStyles.paragraphStyle,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  if (function != null) {
                    function!();
                  }
                },
                child: Container(
                  height: h * 0.05,
                  width: w * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: FoodiesColors.accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Show Menu",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: FoodiesColors.card),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.h,
          ),
        ],
      ),
    );
  }
}
