import 'package:flutter/material.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';

class ThemeControllers extends GetxController {
  var isDark = false;

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDark = false;
      Get.changeTheme(ThemeData.light()
          .copyWith(scaffoldBackgroundColor: FoodiesColors.backgroundColor));
    }
    update();
  }
}
