import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/utils/chekOutProductCard.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            automaticallyImplyLeading: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                "Check Out Details",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.028,
                    color: FoodiesColors.textColor),
              ),
            ),
            iconTheme: const IconThemeData(color: FoodiesColors.textColor),
            backgroundColor: FoodiesColors.backgroundColor,
          ),
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CheckOutProductCard(
                  image: AppAssets.Jalapeno_pizza_1,
                  title: "Margherita Pizza",
                  qty: 1,
                  price: 199,
                  rating: 3.2,
                  favIcon: Icons.favorite,
                  disLike: Icons.favorite_border_outlined,
                  index: index);
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FoodiesColors.cardColor,
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
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "COUPONS",
                      style: AppTextStyles.titleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.discount_outlined,
                        size: 27,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      const Text(
                        "APPLY COUPONS",
                        style: AppTextStyles.titleStyle,
                      ),
                      const Spacer(),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.r, vertical: 8.0.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: FoodiesColors.accentColor),
                          ),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                color: FoodiesColors.accentColor,
                                fontFamily: "Inter",
                                fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      "Login to get upto ${Words.INRSymbol} 300 OFF on first Order",
                      style: TextStyle(
                          color: FoodiesColors.textColor.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Price Details (3 Items)",
                        style: AppTextStyles.homeTitleStyle,
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total MRP",
                              style: AppTextStyles.titleStyle,
                            ),
                            Text("${Words.INRSymbol} 597",
                                style: AppTextStyles.titleStyle),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount on MRP",
                              style: AppTextStyles.titleStyle,
                            ),
                            Text("${Words.INRSymbol} -3",
                                style: AppTextStyles.titleStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Coupon Discount",
                              style: AppTextStyles.titleStyle,
                            ),
                            Text("Apply Coupan",
                                style: TextStyle(
                                    color: FoodiesColors.accentColor,
                                    fontSize: 14.sp)),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Convenience Fee",
                              style: AppTextStyles.titleStyle,
                            ),
                            Text("${Words.INRSymbol} 99",
                                style: AppTextStyles.titleStyle),
                          ],
                        ),
                        const Divider(
                          color: FoodiesColors.textColor,
                          thickness: 2,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: AppTextStyles.titleStyle,
                            ),
                            Text("${Words.INRSymbol} 696",
                                style: AppTextStyles.titleStyle),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 150.h,
        width: w,
        margin: EdgeInsets.all(10.0.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: FoodiesColors.cardBackground),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.my_location_outlined,
                    color: FoodiesColors.accentColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Delivery at Raipur",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inder',
                      fontSize: 14.0.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "change",
                        style: TextStyle(
                            color: FoodiesColors.accentColor,
                            fontFamily: 'Inder',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ))
                ],
              ),
            ),
            const Divider(
              indent: 5,
              endIndent: 5,
              thickness: 1,
              color: FoodiesColors.accentColor,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: w,
                margin: EdgeInsets.symmetric(horizontal: 5.r),
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 15.r),
                decoration: BoxDecoration(
                    color: FoodiesColors.accentColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  "Place Order",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
