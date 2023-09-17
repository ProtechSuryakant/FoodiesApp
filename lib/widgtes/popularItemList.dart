import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/utils/popularItemsCard.dart';

class PopularItemList extends StatefulWidget {
  const PopularItemList({super.key});

  @override
  State<PopularItemList> createState() => _PopularItemListState();
}

class _PopularItemListState extends State<PopularItemList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return const PopularItemCard(
            favIcon: Icons.favorite_border_outlined,
            ratIcon: Icons.star,
            itemRating: 4.4,
            image: AppAssets.pizza_ai1,
            itemTitle: "Chicken Sandwich",
            itemDetails: "There are many variations of purpose"
                "available, but the majority have suffer.",
            itemPrice: 125.00,
          );
        },
      ),
    );
  }
}