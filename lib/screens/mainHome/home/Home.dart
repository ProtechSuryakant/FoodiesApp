import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/utils/popularItemsCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  Container(
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
      body: ListView(
        children: [
          SizedBox(
              height: h * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10.h,
                  ),
                  Container(
                    width: w * 0.45,
                    height: h * 0.08,
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
                          image: AssetImage(AppAssets.offer1),
                          fit: BoxFit.contain,
                          height: 40.h,
                          width: 40.h,
                        ),
                        Text("  Chhese Burger", style: AppTextStyles.titleStyle)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Container(
                    width: w * 0.45,
                    height: h * 0.08,
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
                          image: AssetImage(AppAssets.offer4),
                          fit: BoxFit.contain,
                          height: 40.h,
                          width: 40.h,
                        ),
                        Text("  Corn Pizza", style: AppTextStyles.titleStyle)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                ],
              )),
          Container(
            height: h * 0.25,
            width: w,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage(AppAssets.banner3), fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            alignment: Alignment.center,
            child: const Text(
              "Our Popular Food Items",
              style: AppTextStyles.homeTitleStyle,
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularItemCard(),
                PopularItemCard(),
                PopularItemCard(),
                PopularItemCard(),
                PopularItemCard(),
                PopularItemCard(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            alignment: Alignment.center,
            child: const Text(
              "Our Pizza Menus",
              style: AppTextStyles.homeTitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
