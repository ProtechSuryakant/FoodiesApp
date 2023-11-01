import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/apis/Apis.dart';

class LoginController extends GetxController {
  bool isLoading = true;
  Future<void> loginWithMobileNumber(
      String mobilenumber, BuildContext context) async {
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.login);
      Map body = {
        "mobileNumber": mobilenumber,
      };

      http.Response response =
          await http.patch(url, body: jsonEncode(body), headers: headers);

      if (isLoading) {
        const CircularProgressIndicator();
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          final userData = json['user'];
          final otp = userData['otp'];
          Get.offAndToNamed(
            AppRoutes.otpVerification,
            arguments: {
              'number': mobilenumber,
              'otp': otp,
            },
          );
          isLoading = false;
        }
      } else {
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: FoodiesColors.cardBackground,
            textColor: FoodiesColors.textColor,
            fontSize: 16.0.sp);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: FoodiesColors.cardBackground,
          textColor: FoodiesColors.textColor,
          fontSize: 16.0.sp);
    }
  }
}
