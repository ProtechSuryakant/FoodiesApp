import 'package:get/get.dart';

class ShortCheckboxController extends GetxController {
  RxBool isRatingHL = false.obs;
  RxBool isRating = false.obs;
  RxBool isDeliveryTimeLowToHigh = false.obs;
  RxBool isDeliveryTimeHighToLow = false.obs;
  RxBool costLH = false.obs;
  RxBool costHL = false.obs;

  void toggleCheckbox(String checkboxName) {
    switch (checkboxName) {
      case 'isRatingHL':
        isRatingHL.value = !isRatingHL.value;
        break;
      case 'isRating':
        isRating.value = !isRating.value;
        break;
      case 'isDeliveryTimeLowToHigh':
        isDeliveryTimeLowToHigh.value = !isDeliveryTimeLowToHigh.value;
        break;
      case 'isDeliveryTimeHighToLow':
        isDeliveryTimeHighToLow.value = !isDeliveryTimeHighToLow.value;
        break;
      case 'costLH':
        costLH.value = !costLH.value;
        break;
      case 'costHL':
        costHL.value = !costHL.value;
        break;
      default:
        break;
    }
  }
}
