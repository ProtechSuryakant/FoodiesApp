import 'package:flutter/material.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/utils/poductCard.dart';

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
          return const Padding(
            padding: EdgeInsets.all(15.0),
            child: ProductCard(
              favIcon: Icons.favorite_border_outlined,
              productTitle: "Margarita Pizza",
              image: AppAssets.Jalapeno_pizza_1,
              price: 259,
              productDesc:
                  "Margherita Pizza features a thin crust topped with three basic ingredients: fresh tomato sauce, mozzarella cheese, and fresh basil leaves.",
              rating: 3.5,
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
