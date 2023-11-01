import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControllers extends GetxController {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    update();
  }
}
