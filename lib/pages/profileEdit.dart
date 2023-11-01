import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/EditProfileController.dart';
import 'package:foodies_app/controllers/datePickerController.dart';
import 'package:foodies_app/controllers/getUsersController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late String selectedRadio;

  bool isReadOnlyNumber = true;
  bool isReadOnlyEmail = false;

  final TextEditingController _fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final GetUserController getUserController = Get.put(GetUserController());

  late String? fullName;
  late String mobile;
  late String? email;
  late String? dob;
  late String? gender;

  @override
  void initState() {
    super.initState();
    getUserController.getAllUsers(context);
    _fullNameController.text = userOne['fullName'];
    mobileNumberController.text = userOne['mobileNumber'];
    _emailController.text = userOne['email'];
    dob = userOne['dob'];
    if (userOne['gender'] == "") {
      selectedRadio = 'Male';
    } else {
      selectedRadio = userOne['gender'];
    }
  }

  selectGender(String value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    getUserController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final __datePickercontroller = Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: FoodiesColors.cardBackground,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Edit Profile",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TextFormField(
              // initialValue: fullName ?? "Enter your name",
              controller: _fullNameController,
              decoration: InputDecoration(
                  label: const Text(
                    "Full Name",
                    style: TextStyle(color: FoodiesColors.textColor),
                  ),
                  hintText: "Full Name",
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: FoodiesColors.accentColor))),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              child: TextFormField(
                controller: mobileNumberController,
                // initialValue: ,
                keyboardType: TextInputType.number,
                maxLength: 10,
                readOnly: isReadOnlyNumber,
                onTap: () {
                  print("Mobile");
                },
                decoration: InputDecoration(
                    hintStyle: const TextStyle(color: FoodiesColors.textColor),
                    label: const Text(
                      "Mobile",
                      style: TextStyle(color: Colors.black),
                    ),
                    counterText: "",
                    hintText: "Mobile",
                    suffixText: "Change",
                    suffixStyle: TextStyle(
                        color: FoodiesColors.accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: FoodiesColors.accentColor))),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              // initialValue: _email,
              readOnly: isReadOnlyEmail,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onTap: () {
                print("Email Clicked");
              },
              decoration: InputDecoration(
                  label: const Text(
                    "Email",
                    style: TextStyle(color: Colors.black),
                  ),
                  hintText: "Email",
                  suffixText: isReadOnlyEmail ? "Change" : "",
                  suffixStyle: TextStyle(
                      color: FoodiesColors.accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: FoodiesColors.accentColor))),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gender :",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Male ",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 'Male',
                  groupValue: selectedRadio,
                  activeColor: FoodiesColors.accentColor,
                  onChanged: (val) {
                    selectGender(val!);
                    print("Radio $val");
                  },
                ),
                Text(
                  "Female ",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                Radio(
                    value: 'Female',
                    groupValue: selectedRadio,
                    activeColor: FoodiesColors.accentColor,
                    onChanged: (val) {
                      selectGender(val!);
                      print("Radio $val");
                    }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 1)),
            child: Row(
              children: [
                Text(
                  "DOB :",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  __datePickercontroller.formattedDate.value,
                  style: TextStyle(
                      color: FoodiesColors.textColor.withOpacity(0.7),
                      fontSize: h * 0.020.h),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      __datePickercontroller.showDatePicker();
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: FoodiesColors.accentColor,
                    ))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (_fullNameController.text.isEmpty) {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        title: "Warning",
                        titleTextStyle: const TextStyle(
                            color: Color(0xFF293265),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        desc: "Please enter full Name",
                        descTextStyle: const TextStyle(fontSize: 18),
                        btnOkOnPress: () {
                          Get.obs();
                        },
                        btnOkColor: FoodiesColors.accentColor)
                    .show();
              } else {
                _editProfileController.EditProfile(
                    _fullNameController.text,
                    _emailController.text,
                    selectedRadio,
                    __datePickercontroller.formattedDate.value,
                    mobileNumberController.text,
                    context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.r),
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 15.r),
              decoration: BoxDecoration(
                color: FoodiesColors.accentColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
