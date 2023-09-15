import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/appMessages.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/msgTitle.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginWithNumber extends StatefulWidget {
  const LoginWithNumber({super.key});

  @override
  State<LoginWithNumber> createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  final _mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: w,
            height: h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.loginbg4), fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 185, top: 100),
                    height: h * 0.12.h,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Sign ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: h * 0.045.h,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.Inter,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "In...",
                                style: TextStyle(
                                  color: FoodiesColors.primaryColor,
                                  fontSize: h * 0.045.h,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: AppFonts.Inter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Register with mobile number.",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: h * 0.020.h,
                            fontFamily: AppFonts.Inder,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    color: FoodiesColors.cardColor,
                    child: IntlPhoneField(
                      controller: _mobileNumber,
                      initialCountryCode: 'IN',
                      initialValue: '+91',
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: FoodiesColors.textColor)),
                          counterText: "",
                          labelText: "Mobile Number",
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: FoodiesColors.textColor)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: FoodiesColors.textColor))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_mobileNumber.text.isEmpty) {
                        AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                dialogType: DialogType.info,
                                title: MsgTitle.Info,
                                desc: AppMessages.mobileNumberInfo,
                                descTextStyle: const TextStyle(
                                    fontSize: FontSize.smallBodyText),
                                isDense: false,
                                btnOkText: 'OK',
                                btnOkOnPress: () {
                                  Get.obs();
                                },
                                btnOkColor: FoodiesColors.accentColor)
                            .show();
                      } else if (_mobileNumber.text.length < 10) {
                        AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                dialogType: DialogType.info,
                                title: MsgTitle.Info,
                                desc: AppMessages.mobileNumberLength,
                                descTextStyle: const TextStyle(
                                    fontSize: FontSize.smallBodyText),
                                isDense: false,
                                btnOkText: 'OK',
                                btnOkOnPress: () {
                                  Get.obs();
                                },
                                btnOkColor: FoodiesColors.accentColor)
                            .show();
                      } else {
                        AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                dialogType: DialogType.success,
                                title: MsgTitle.Success,
                                desc: AppMessages.success,
                                descTextStyle: const TextStyle(
                                    fontSize: FontSize.smallBodyText),
                                isDense: false,
                                btnOkText: 'OK',
                                btnOkOnPress: () {
                                  Get.toNamed(AppRoutes.otpVerification);
                                },
                                btnOkColor: FoodiesColors.accentColor)
                            .show();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: w,
                      height: h * 0.06.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: FoodiesColors.accentColor,
                        borderRadius: BorderRadius.circular((4).r),
                      ),
                      child: Text(
                        "Get OTP",
                        style: TextStyle(
                            fontSize: h * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(children: <Widget>[
                      const Expanded(
                          child: Divider(
                        thickness: 1,
                        color: FoodiesColors.accentColor,
                      )),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(fontSize: FontSize.smallBodyText),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 1,
                        color: FoodiesColors.accentColor,
                      )),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: FoodiesColors.cardColor,
                          child: ClipOval(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.google),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: FoodiesColors.cardColor,
                          child: ClipOval(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.facebook),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: FoodiesColors.cardColor,
                          radius: 28,
                          child: ClipOval(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.tweeter),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
