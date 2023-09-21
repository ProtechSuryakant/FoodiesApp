import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/utils/_showPriceBottomsheet.dart';
import 'package:foodies_app/utils/categoryCard2.dart';
import 'package:get/get.dart';

class CategoryList2 extends StatefulWidget {
  const CategoryList2({super.key});

  @override
  State<CategoryList2> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList2> {
  bool isRating = false;
  bool isRatingHL = false;
  bool isDeliveryTimeHighToLow = false;
  bool isDeliveryTimeLowToHigh = false;
  bool costLH = false;
  bool costHL = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.07.h,
      width: w,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  showBottomSheet(
                      enableDrag: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                            // color: Colors.amber,
                            height: h * 0.75,
                            width: w,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Colors.black.withOpacity(0.5),
                                        child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        height: h * 0.65,
                                        width: w,
                                        decoration: BoxDecoration(
                                            color: FoodiesColors.cardBackground,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5,
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  offset:
                                                      const Offset(0, -0.25))
                                            ]),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              margin: const EdgeInsets.only(
                                                  top: 20,
                                                  left: 20,
                                                  bottom: 10),
                                              child: const Text(
                                                "Sort",
                                                style: AppTextStyles
                                                    .homeTitleStyle,
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: FoodiesColors.accentColor,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Rating : High To Low",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value: isRatingHL,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRatingHL =
                                                              !isRatingHL;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Rating : Low To High",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value: isRating,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRating == !isRating;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Delivery Distance : Low To High",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value:
                                                          isDeliveryTimeLowToHigh,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRating == newValue;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Delivery Distance : High To Low",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value:
                                                          isDeliveryTimeHighToLow,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRating == newValue;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Cost : Low To High",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value: costLH,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRating == newValue;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Cost : High To Low",
                                                    style: AppTextStyles
                                                        .titleStyle,
                                                  ),
                                                  Radio(
                                                      activeColor: FoodiesColors
                                                          .accentColor,
                                                      value: costHL,
                                                      groupValue: true,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          isRating == newValue;
                                                        });
                                                      })
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: FoodiesColors.accentColor,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Clear All",
                                                        style: TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18,
                                                            color: FoodiesColors
                                                                .accentColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  InkWell(
                                                    onTap: () =>
                                                        print("Applied"),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              left: 15,
                                                              right: 15,
                                                              bottom: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: FoodiesColors
                                                              .accentColor),
                                                      child: const Text(
                                                        "Apply",
                                                        style: TextStyle(
                                                            color: FoodiesColors
                                                                .cardColor,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      });
                },
                child: const CategoryCard2(
                  prefixIcon: Icons.swap_horiz,
                  title: 'Short',
                  suffixIcon: Icons.arrow_drop_down,
                ),
              ),
            );
          } else if (index == 1) {
            return const Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryCard2(
                title: 'Nearest',
              ),
            );
          } else if (index == 2) {
            return const Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryCard2(
                prefixIcon: Icons.star,
                title: 'Rating 4.4',
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  showBottomSheet(
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ((context) {
                        return ShowPriceBottomSheet(
                          key: _scaffoldKey,
                        );
                      }));
                },
                child: const CategoryCard2(
                  prefixIcon: Icons.money_sharp,
                  title: 'Filter By Price',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
