import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Get_Image extends GetxController {
  final Rx<File?> _image = Rx<File?>(null);

  File? get image => _image.value;

  Future<void> getProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image.value = File(image.path);
    }
  }
}