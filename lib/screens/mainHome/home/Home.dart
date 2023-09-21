import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';

import 'package:foodies_app/widgtes/categoryList.dart';
import 'package:foodies_app/widgtes/categoryList2.dart';
import 'package:foodies_app/widgtes/menuCardLists.dart';
import 'package:foodies_app/widgtes/poductsList.dart';
import 'package:foodies_app/widgtes/popularItemList.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            flexibleSpace: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              color: FoodiesColors.cardBackground,
              height: h * 0.7,
              width: w,
              child: Row(
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
                              height: 10.h,
                              width: 10.w,
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
          ),
          SliverPersistentHeader(
            delegate: MyPersistentHeaderDelegate(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
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
                                child: Row(
                                  children: [
                                    Image(
                                      image: const AssetImage(AppAssets.offer1),
                                      fit: BoxFit.contain,
                                      height: 40.h,
                                      width: 40.h,
                                    ),
                                    const Text("  Cheese Burger",
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
                                padding: const EdgeInsets.all(10),
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
                                padding: const EdgeInsets.all(10),
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
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
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
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Our Popular Food Items",
                style: AppTextStyles.homeTitleStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: PopularItemList(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Foodies Menus",
                style: AppTextStyles.homeTitleStyle,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: MenuCardList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: FoodiesColors.accentColor,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  const Text(
                    "Your Choices",
                    style: AppTextStyles.paragraphStyle,
                  ),
                  SizedBox(width: 5.w),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: FoodiesColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoryList(),
          ),
          const SliverToBoxAdapter(
            child: CategoryList2(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: FoodiesColors.accentColor,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  const Text(
                    "All Foodies Items",
                    style: AppTextStyles.paragraphStyle,
                  ),
                  SizedBox(width: 5.w),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: FoodiesColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ProductList()
        ],
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 90.0;
  @override
  double get maxExtent => 90.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: const EdgeInsets.all(15),
        color: FoodiesColors.cardBackground,
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: FoodiesColors.card,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              style: const TextStyle(fontSize: FontSize.mediumBodyText),
              decoration: InputDecoration(
                  hintText: "Search here.....",
                  border: InputBorder.none,
                  focusColor: FoodiesColors.textColor,
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: FoodiesColors.accentColor,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        print("Mic Clicked");
                      },
                      icon: const Icon(
                        CupertinoIcons.mic,
                        color: FoodiesColors.accentColor,
                      ))),
            )));
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
