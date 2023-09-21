import 'package:flutter/material.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:get/get.dart';

class MenuData extends GetxController {
  final String type;
  final String image;
  final String title;
  final String desc;
  final String itemType;
  final double rating;
  final IconData? iconData;
  final IconData? shareIcon;
  final double Price;

  MenuData({
    required this.type,
    required this.image,
    required this.title,
    required this.desc,
    required this.itemType,
    required this.rating,
    this.iconData,
    this.shareIcon,
    required this.Price,
  });
}

List<String> menuType = ["Sushi", "French Fries", "Chicken Barbecue"];

List<MenuData> menuData = [
  MenuData(
      type: menuType[0].toString(),
      image: AppAssets.sushi1,
      title: "Nigirizushi",
      desc:
          "A hand-pressed bed of rice topped with a single piece of seafood. ",
      itemType: "Veg",
      rating: 4.3,
      Price: 199.0),
  MenuData(
      type: menuType[1].toString(),
      image: AppAssets.pizza_ai1,
      title: "Chirashizushi",
      desc: "A colorful mix of ingredients scattered over sushi rice.",
      itemType: "Non-Veg",
      rating: 3.4,
      Price: 255.0),
  MenuData(
      type: menuType[2].toString(),
      image: AppAssets.pizza_ai1,
      title: "California roll",
      desc: "A popular roll containing crabmeat, avocado, and cucumber.",
      itemType: "Veg",
      rating: 4.4,
      Price: 219.0),
  MenuData(
      type: menuType[2].toString(),
      image: AppAssets.pizza_ai1,
      title: "Sashimi",
      desc: "Fresh, raw fish or meat cut into thin slices.",
      itemType: "Non-Veg",
      rating: 4.2,
      Price: 299.0),
  MenuData(
      type: menuType[2].toString(),
      image: AppAssets.pizza_ai1,
      title: "Temakizushi",
      desc:
          "Rice and ingredients held within a sheet of nori wrapped into a conical shape.",
      itemType: "Veg",
      rating: 4.2,
      Price: 199.0)
];
