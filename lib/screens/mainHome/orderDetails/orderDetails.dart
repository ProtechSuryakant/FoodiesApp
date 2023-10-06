import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/utils/orderHistoryCard.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: FoodiesColors.cardColor,
              automaticallyImplyLeading: false,
              pinned: false,
              floating: true,
              centerTitle: true,
              title: Text(
                "Order History",
                style: TextStyle(
                    color: FoodiesColors.textColor,
                    fontSize: h * 0.025.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SliverPersistentHeader(
              delegate: MyPersistentHeaderDelegate(),
              pinned: true,
            ),
            SliverList.builder(
              itemBuilder: (BuildContext context, int index) {
                return const OrderHistoryCard(
                    image: AppAssets.coleslaw,
                    address: "Foodies 04, Raipur",
                    status: "Status",
                    btnColor: Colors.green,
                    qty: 3,
                    size: "Regular",
                    date: "20 Sep, 2023 at 8:00PM",
                    price: 199.0,
                    rating: 4.5,
                    title: "La pino de pizza",
                    txtColor: Colors.white);
              },
              itemCount: 10,
            )
          ],
        ),
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70.0.h;
  @override
  double get maxExtent => 70.0.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: FoodiesColors.cardBackground,
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.center,
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
