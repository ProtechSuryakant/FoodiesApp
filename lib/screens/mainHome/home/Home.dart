import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/widgtes/bestDeaslList.dart';
import 'package:foodies_app/widgtes/categoryList.dart';
import 'package:foodies_app/widgtes/categoryList2.dart';
import 'package:foodies_app/widgtes/menuCardLists.dart';
import 'package:foodies_app/widgtes/popularItemList.dart';
import 'package:foodies_app/utils/popularItemsCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imageList = [
    {"id": 1, "image_path": AppAssets.banner1},
    {"id": 2, "image_path": AppAssets.banner2},
    {"id": 3, "image_path": AppAssets.banner3},
  ];

  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: FoodiesColors.cardBackground,
        flexibleSpace: Container(
          height: h * 0.15,
          color: FoodiesColors.cardBackground,
        ),
        title: Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 35,
              color: FoodiesColors.accentColor,
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Work',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                          color: FoodiesColors.textColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Image(
                        image: const AssetImage(AppAssets.down_arrow),
                        height: 15.h,
                        width: 15.h,
                      )
                    ],
                  ),
                  SizedBox(
                    width: w * 0.35,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      'Civil Lines Raipur,12345678',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: FoodiesColors.textColor,
                        fontFamily: 'Inder',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 27,
                  color: FoodiesColors.textColor,
                )),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: ClipOval(
                child: Image(
                  image: const AssetImage(
                    AppAssets.table_book_icon,
                  ),
                  fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(30),
                  width: ScreenUtil().setHeight(30),
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(10),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: ClipOval(
                child: Image(
                  image: const AssetImage(
                    AppAssets.user,
                  ),
                  fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(30),
                  width: ScreenUtil().setHeight(30),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(20),
                // height: h * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
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
                        child: Row(
                          children: [
                            Image(
                              image: const AssetImage(AppAssets.offer1),
                              fit: BoxFit.contain,
                              height: 40.h,
                              width: 40.h,
                            ),
                            const Text("  Chhese Burger",
                                style: TextStyle(
                                    fontFamily: 'Inder',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.h,
                            ),
                            Image(
                              image: const AssetImage(AppAssets.offer4),
                              fit: BoxFit.contain,
                              height: 40.h,
                              width: 40.h,
                            ),
                            const Text("  Corn Pizza",
                                style: TextStyle(
                                    fontFamily: 'Inder',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.h,
                            ),
                            Image(
                              image: const AssetImage(AppAssets.offer2),
                              fit: BoxFit.contain,
                              height: 40.h,
                              width: 40.h,
                            ),
                            const Text("  Paneer Pizza",
                                style: TextStyle(
                                    fontFamily: 'Inder',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: InkWell(
                  onTap: () => print("$currentIndex"),
                  child: CarouselSlider(
                    items: imageList
                        .map((item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ))
                        .toList(),
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Our Popular Food Items",
                style: AppTextStyles.homeTitleStyle,
              ),
            ),
            const PopularItemList(),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Foodies Menus",
                style: AppTextStyles.homeTitleStyle,
              ),
            ),
            const MenuCardList(),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Todays's Best Deals",
                style: AppTextStyles.homeTitleStyle,
              ),
            ),
            const BestDealsToday(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: <Widget>[
                const Expanded(
                    child: Divider(
                  thickness: 1,
                  color: FoodiesColors.accentColor,
                )),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  "Your Choices",
                  style: AppTextStyles.paragraphStyle,
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Expanded(
                    child: Divider(
                  thickness: 1,
                  color: FoodiesColors.accentColor,
                )),
              ]),
            ),
            const CategoryList(),
            const CategoryList2(),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}