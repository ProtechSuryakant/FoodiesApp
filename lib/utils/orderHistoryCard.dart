import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';

class OrderHistoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String address;
  final String status;
  final Color btnColor;
  final Color txtColor;
  final int qty;
  final String size;
  final String date;
  final double price;
  final double rating;
  const OrderHistoryCard(
      {super.key,
      required this.image,
      required this.address,
      required this.status,
      required this.btnColor,
      required this.qty,
      required this.size,
      required this.date,
      required this.price,
      required this.rating,
      required this.title,
      required this.txtColor});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
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
      child: Column(
        children: [
          Container(
              // height: h * 0.1.h,
              width: w.h,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: FoodiesColors.cardColor),
              child: Row(
                children: [
                  Container(
                    height: h * 0.12.h,
                    width: w * 0.25.w,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          title,
                          style: TextStyle(
                              fontSize: h * 0.022.sp,
                              fontFamily: 'Inder',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          address,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: h * 0.015.sp,
                              fontFamily: 'Inder',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: btnColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            status,
                            style: TextStyle(fontSize: 13.0.h, color: txtColor),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: () {
                            print("View Menu");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "View Menu",
                                  style: TextStyle(
                                      fontSize: 12.h,
                                      color: FoodiesColors.accentColor),
                                ),
                                Image(
                                  image: const AssetImage(
                                    AppAssets.down_arrow,
                                  ),
                                  color: FoodiesColors.accentColor,
                                  height: 10.h,
                                  width: 10.w,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Text(
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      "Qty. : $qty x",
                      style: const TextStyle(
                          fontSize: FontSize.smallBodyText,
                          fontFamily: 'Inder',
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            alignment: Alignment.centerLeft,
            child: Text(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
              size,
              style: TextStyle(
                fontSize: h * 0.015.sp,
                fontFamily: 'Inder',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: h * 0.015.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  "${Words.INRSymbol} $price",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: h * 0.015.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.r, bottom: 5.r),
                child: Text(
                  "Rate",
                  style: TextStyle(
                      color: FoodiesColors.accentColor,
                      fontFamily: "Inder",
                      fontSize: h * .018.sp),
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.r),
                child: RatingBar.builder(
                  initialRating: rating,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (value) {
                    print(value);
                  },
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  print("Cancel not allowed..");
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(
                    bottom: 5.r,
                  ),
                  child: Text(
                    "Cancel Order.....",
                    style: TextStyle(
                        fontSize: 14.h, color: FoodiesColors.accentColor),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
