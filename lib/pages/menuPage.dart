import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: FoodiesColors.backgroundColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 250.h,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage(AppAssets.sushi2),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
