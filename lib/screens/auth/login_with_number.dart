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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.maxWidth;
          double h = constraints.maxHeight;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.loginbg4),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(left: w * 0.75.h, top: h * 0.04),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.homeMain);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: h * 0.025.h,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(left: w * 0.45, top: h * 0.05),
                          height: h * 0.12,
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
                                    fontSize: w * 0.08,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.Inter,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "In...",
                                      style: TextStyle(
                                        color: FoodiesColors.primaryColor,
                                        fontSize: w * 0.08,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: AppFonts.Inter,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Register with a mobile number.",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: w * 0.035,
                                  fontFamily: AppFonts.Inder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.all(w * 0.05),
                          color: FoodiesColors.cardColor,
                          child: IntlPhoneField(
                            controller: _mobileNumber,
                            initialCountryCode: 'IN',
                            initialValue: '+91',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: FoodiesColors.textColor),
                              ),
                              counterText: "",
                              labelText: "Mobile Number",
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: FoodiesColors.textColor,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: FoodiesColors.textColor,
                                ),
                              ),
                            ),
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
                              ).show();
                            } else if (_mobileNumber.text.length < 10) {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                dialogType: DialogType.info,
                                title: MsgTitle.Info,
                                desc: AppMessages.mobileNumberLength,
                                descTextStyle: const TextStyle(
                                    fontSize: FontSize.smallBodyText),
                              ).show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                dialogType: DialogType.success,
                                title: MsgTitle.Success,
                                desc: AppMessages.success,
                                descTextStyle: const TextStyle(
                                    fontSize: FontSize.smallBodyText),
                              ).show();
                              Get.offNamed(AppRoutes.otpVerification);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.05),
                            width: w,
                            height: h * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: FoodiesColors.accentColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                fontSize: w * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.05,
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
                              style:
                                  TextStyle(fontSize: FontSize.smallBodyText),
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
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: w * 0.05,
                                backgroundColor: Colors.transparent,
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
                                radius: w * 0.05,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppAssets.facebook),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: w * 0.05,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
