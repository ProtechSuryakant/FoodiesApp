import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/favController.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final IconData favIcon;
  final IconData disLike;
  final String productTitle;
  final String productDesc;
  final String image;
  final double price;
  final double rating;
  final CallbackAction? function;
  final int index;
  ProductCard(
      {super.key,
      required this.productTitle,
      required this.productDesc,
      required this.image,
      required this.price,
      required this.rating,
      this.function,
      required this.favIcon,
      required this.disLike,
      required this.index});

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: Obx(() => IconButton(
                onPressed: () {
                  if (favoriteController.isFavorite(index) == true) {
                    favoriteController.toggleRemoveFavorite(index);
                  } else {
                    favoriteController.toggleAddFavorite(index);
                  }
                },
                icon: favoriteController.isFavorite(index)
                    ? Icon(
                        favIcon,
                        color: FoodiesColors.accentColor,
                      )
                    : Icon(
                        disLike,
                      ))),
          ),
          Container(
            alignment: Alignment.center,
            height: h * 0.25,
            width: w * 0.55,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              productTitle,
              style: AppTextStyles.headingStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.justify,
              productDesc,
              style: AppTextStyles.productDesc,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹ $price",
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inder',
                    color: FoodiesColors.accentColor,
                  ),
                ),
                SizedBox(
                  child: RatingBar.builder(
                    itemSize: 20,
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    tapOnlyMode: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.checkOutDetails);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: FoodiesColors.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
