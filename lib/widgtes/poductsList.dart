import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/utils/poductCard.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.all(15.0.r),
            child: ProductCard(
              favIcon: Icons.favorite,
              productTitle: "Margarita Pizza",
              image: AppAssets.Jalapeno_pizza_1,
              price: 259,
              productDesc:
                  "Margherita Pizza features a thin crust topped with three basic ingredients: fresh tomato sauce, mozzarella cheese, and fresh basil leaves.",
              rating: 3.5,
              disLike: Icons.favorite_border_outlined,
              index: index,
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
