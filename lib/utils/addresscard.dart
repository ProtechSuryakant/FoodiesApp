import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      padding: EdgeInsets.symmetric(vertical: 10.r),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                CupertinoIcons.home,
                size: 20,
              ),
              SizedBox(
                width: 50.w,
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  "2.2 Km",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10.r, right: 15.r),
                child: Text(
                  "Work",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 200.w,
                margin: EdgeInsets.only(left: 10.r, right: 10.r),
                padding: EdgeInsets.symmetric(vertical: 5.r),
                child: Text(
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.visible,
                  "08 Second floor govind kunj, Civil Lines, Raipur",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => print("More......"),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: FoodiesColors.cardBackground,
              child: ClipOval(
                child: Image.asset(
                  'assets/png/more.png',
                  fit: BoxFit.contain,
                  height: 20,
                  width: 20,
                  color: FoodiesColors.accentColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
