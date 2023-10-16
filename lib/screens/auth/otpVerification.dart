import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appMessages.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/msgTitle.dart';
import 'package:get/get.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  FocusNode firstDigitFocusNode = FocusNode();
  FocusNode secondDigitFocusNode = FocusNode();
  FocusNode thirdDigitFocusNode = FocusNode();
  FocusNode fourthDigitFocusNode = FocusNode();
  // FocusNode fifthDigitFocusNode = FocusNode();
  // FocusNode sixthDigitFocusNode = FocusNode();

  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  // final TextEditingController _otpController5 = TextEditingController();
  // final TextEditingController _otpController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            left: 0.h,
            right: 0.h,
            child: Container(
                height: h * 0.4,
                width: w,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage(AppAssets.loginBurger),
                      fit: BoxFit.cover),
                )),
          ),
          Positioned(
            top: 40.h,
            left: 20.h,
            right: 20.h,
            child: Container(
              height: h * 0.06,
              width: w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: FoodiesColors.cardColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Text(
                    "Verification Code",
                    style: TextStyle(
                        // color: FoodiesColors.accentColor,

                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.028),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 350.h,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Please enter  OTP sent to your mobile number.",
                    style: TextStyle(fontSize: FontSize.smallBodyText),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOTPTextField(_otpController1),
                      SizedBox(
                        width: w * 0.05.h,
                      ),
                      buildOTPTextField(_otpController2),
                      SizedBox(
                        width: w * 0.05.h,
                      ),
                      buildOTPTextField(_otpController3),
                      SizedBox(
                        width: w * 0.05.h,
                      ),
                      buildOTPTextField(_otpController4),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 470.h,
            left: 30.h,
            right: 30.h,
            child: InkWell(
              onTap: () {
                if (_otpController1.text.isEmpty ||
                    _otpController2.text.isEmpty ||
                    _otpController3.text.isEmpty ||
                    _otpController4.text.isEmpty) {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.topSlide,
                          title: MsgTitle.Info,
                          titleTextStyle: const TextStyle(
                              color: Color(0xFF293265),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          desc: AppMessages.otpLoginValidation,
                          descTextStyle: const TextStyle(fontSize: 18),
                          btnOkOnPress: () {
                            Get.obs();
                          },
                          btnOkColor: Colors.pink)
                      .show();
                } else {
                  AwesomeDialog(
                          context: context,
                          animType: AnimType.topSlide,
                          dialogType: DialogType.success,
                          title: MsgTitle.Success,
                          descTextStyle:
                              const TextStyle(fontSize: FontSize.smallBodyText),
                          isDense: false,
                          btnOkText: 'OK',
                          btnOkOnPress: () {
                            Get.offAndToNamed(AppRoutes.homeMain);
                          },
                          btnOkColor: FoodiesColors.accentColor)
                      .show();
                }
              },
              child: Container(
                width: w.h,
                height: h * 0.06.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: FoodiesColors.accentColor,
                  borderRadius: BorderRadius.circular((4).r),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(
                      fontSize: h * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildOTPTextField(TextEditingController controller) {
    return Container(
      color: FoodiesColors.cardColor,
      width: 50.0.h,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: FontSize.mediumBodyText, color: FoodiesColors.textColor),
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: const InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: FoodiesColors.textColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: FoodiesColors.textColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: FoodiesColors.textColor))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a digit';
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
