import 'package:get/get.dart';

class OrderQtyBtn extends GetxController {
  RxInt Qty = 1.obs;

  void qtyIncrement() {
    Qty++;

    update();
  }

  void qtyDecrement() {
    if (Qty != 1) {
      Qty--;
    }
    update();
  }

  RxInt checkOutQty = 1.obs;

  void qtyCheckoutIncrement(int item) {
    checkOutQty++;

    update();
  }

  void qtyCheckoutDecrement(int item) {
    if (checkOutQty != 1) {
      checkOutQty--;
    }
    update();
  }
}
