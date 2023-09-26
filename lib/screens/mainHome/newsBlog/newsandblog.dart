import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class NewsAndBlog extends StatefulWidget {
  const NewsAndBlog({super.key});

  @override
  State<NewsAndBlog> createState() => _NewsAndBlogState();
}

class _NewsAndBlogState extends State<NewsAndBlog> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: FoodiesColors.cardBackground,
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "New And Blogs",
              style: TextStyle(
                  color: FoodiesColors.textColor,
                  fontSize: h * 0.028.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [Container(), Container()],
                ),
              );
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}
