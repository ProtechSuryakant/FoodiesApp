import 'package:get/get.dart';

class AddProductCart extends GetxController {
  RxList productList = [].obs;

  void toggleAddProduct(int item) {
    productList.add(item);
    update();
  }

  void toggleRemoveProduct(int item) {
    productList.remove(item);
    update();
  }

  bool isProduct(int index) {
    return productList.contains(index);
  }
}
