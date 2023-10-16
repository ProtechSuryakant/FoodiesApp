import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/addProductOnListCart.dart';
import 'package:foodies_app/controllers/favController.dart';
import 'package:foodies_app/controllers/favoriteProductController.dart';
import 'package:foodies_app/controllers/orderQntyBtn.dart';
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

  final FavoriteProductController favoriteController =
      Get.put(FavoriteProductController());
  final AddProductCart _addProductCart = Get.put(AddProductCart());
  final OrderQtyBtn _orderQtyBtn = Get.put(OrderQtyBtn());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(10.r),
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
            padding: EdgeInsets.only(right: 10.w),
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
            height: h * 0.25.h,
            width: w * 0.55.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            alignment: Alignment.center,
            child: Text(
              productTitle,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.justify,
              productDesc,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inder"),
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
                    fontSize: 14.sp,
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
                Obx(() {
                  if (_addProductCart.isProduct(index)) {
                    if (_orderQtyBtn.productHomeQty == 0) {
                      return GestureDetector(
                        onTap: () {
                          _addProductCart.toggleAddProduct(index);
                        },
                        child: Container(
                          width: 80.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: FoodiesColors.accentColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 80.w,
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 10.h,
                          bottom: 10.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: FoodiesColors.accentColor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _orderQtyBtn.qtyProductHomeDecrement(index);
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: FoodiesColors.accentColor,
                                ),
                              ),
                            ),
                            Obx(() {
                              return Text(
                                _orderQtyBtn.productHomeQty.string,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: FoodiesColors.accentColor,
                                ),
                              );
                            }),
                            GestureDetector(
                              onTap: () {
                                _orderQtyBtn.qtyProductHomeIncrement(index);
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: FoodiesColors.accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Container(
                      width: 80.w,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: FoodiesColors.accentColor),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _orderQtyBtn.qtyProductHomeDecrement(index);
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: FoodiesColors.accentColor,
                              ),
                            ),
                          ),
                          Obx(() {
                            return Text(
                              _orderQtyBtn.productHomeQty.string,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: FoodiesColors.accentColor,
                              ),
                            );
                          }),
                          GestureDetector(
                            onTap: () {
                              _orderQtyBtn.qtyProductHomeIncrement(index);
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: FoodiesColors.accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
