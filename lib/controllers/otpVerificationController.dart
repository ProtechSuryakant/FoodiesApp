import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/main.dart';
import 'package:foodies_app/services/apis/Apis.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPVerifyController extends GetxController {
  Future<void> verifyWithOTP(
      String mobile,
      String otp1,
      String otp2,
      String otp3,
      String otp4,
      String otp5,
      String otp6,
      BuildContext context) async {
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.verifyOtp);
      var OTP = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
      Map body = {"mobileNumber": mobile, "otp": OTP};

      http.Response response =
          await http.patch(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          box.write('isLogged', true);
          print(box.read('isLogged'));
          final userData = json['user'];
          final token = userData['token'];
          box.write("access", token);
          Get.offAndToNamed(AppRoutes.homeMain);
        } else {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.topSlide,
                  title: "Information",
                  titleTextStyle: const TextStyle(
                      color: Color(0xFF293265),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  desc: "Invalid OTP.",
                  descTextStyle: const TextStyle(fontSize: 18),
                  btnOkOnPress: () {
                    Get.obs();
                  },
                  btnOkColor: FoodiesColors.accentColor)
              .show();
        }
      } else {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                // showCloseIcon: true,
                title: "Error",
                titleTextStyle: const TextStyle(
                    color: Color(0xFF293265),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                desc: "Something went wrong.",
                descTextStyle: const TextStyle(fontSize: 18),
                btnOkOnPress: () {
                  Get.obs();
                },
                btnOkColor: FoodiesColors.accentColor)
            .show();
      }
    } catch (e) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              // showCloseIcon: true,
              title: "Error",
              titleTextStyle: const TextStyle(
                  color: Color(0xFF293265),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              desc: "Server error.",
              descTextStyle: const TextStyle(fontSize: 18),
              btnOkOnPress: () {
                Get.obs();
              },
              btnOkColor: FoodiesColors.accentColor)
          .show();
    }
  }
}
