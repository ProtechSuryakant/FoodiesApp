import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  static DateTime selectedDate = DateTime.now();

  String formattedDate = selectedDate.toString();
  void _showDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1999),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        selectedDate = value!;
        formattedDate = DateFormat('d, MMM, y', 'en_US').format(selectedDate);
        print(selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
            child: TextFormField(
              initialValue: "Surya",
              decoration: InputDecoration(
                  label: Text(
                    "Fullname",
                    style: TextStyle(color: Colors.black),
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
              initialValue: "7869308919",
              keyboardType: TextInputType.number,
              maxLength: 10,
              readOnly: true,
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
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            child: TextFormField(
              initialValue: "surya@gmail.com",
              readOnly: true,
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
                  suffixText: "Change",
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
            decoration: BoxDecoration(border: Border.all(width: 1)),
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
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: FoodiesColors.accentColor,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(val!);
                  },
                ),
                Text(
                  "Female ",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: FoodiesColors.accentColor,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(val!);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Row(
              children: [
                Text(
                  "DOP :",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  formattedDate.toString(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _showDatepicker();
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: FoodiesColors.accentColor,
                    ))
              ],
            ),
          ),
          InkWell(
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
