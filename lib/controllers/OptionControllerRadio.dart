import 'package:get/get.dart';

class OptionController extends GetxController {
  RxString selectedOption = "Regular".obs;

  void changeOption(String option) {
    selectedOption.value = option;
    update();
  }
}
