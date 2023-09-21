import 'package:foodies_app/constants/assets.dart';

class CategoryDataModals {
  String image;
  String categoryTitle;

  CategoryDataModals({required this.image, required this.categoryTitle});
}

List<CategoryDataModals> categoryData = [
  CategoryDataModals(image: AppAssets.burger2, categoryTitle: "Burger"),
  CategoryDataModals(image: AppAssets.pizza_1, categoryTitle: "Pizza"),
  CategoryDataModals(image: AppAssets.popcorn, categoryTitle: "French Fries"),
  CategoryDataModals(image: AppAssets.eggroll, categoryTitle: "Rolls"),
  CategoryDataModals(image: AppAssets.fast_food, categoryTitle: "Fast Food"),
  CategoryDataModals(image: AppAssets.soft_drink, categoryTitle: "Soft Drink"),
  CategoryDataModals(image: AppAssets.sandwich, categoryTitle: "Sandwich"),
  CategoryDataModals(image: AppAssets.muffins, categoryTitle: "Muffins"),
  CategoryDataModals(image: AppAssets.tacos, categoryTitle: "Tacos"),
  CategoryDataModals(image: AppAssets.coleslaw, categoryTitle: "Coleslaw"),
  CategoryDataModals(image: AppAssets.dumplings, categoryTitle: "Dumplings"),
  CategoryDataModals(image: AppAssets.nachos, categoryTitle: "Nachos"),
];
