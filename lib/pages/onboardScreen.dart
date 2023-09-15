import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/widgtes/DotIndicator.dart';
import 'package:get/get.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _pageController;
  var _pageIndex = 0;
  RxString btnTitle = "Continue".obs;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 30,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _pageIndex = index;
                  if (_pageIndex == 2) {
                    btnTitle.value = "Get Started";
                  } else {
                    btnTitle.value = "Continue";
                  }
                });
              },
              children: pages,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    )),
          ]),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: h * 0.07.h,
            width: w,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: FoodiesColors.accentColor),
            child: ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                if (_pageIndex == 2) {
                  Get.toNamed("/loginNumber");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: FoodiesColors.accentColor,
              ),
              child: Obx(() => Text(
                    btnTitle.value,
                    style: TextStyle(
                        fontSize: FontSize.largeFontSize,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(
                    fontSize: FontSize.smallBodyText,
                    color: Colors.black.withOpacity(0.5)),
              )),
          const Spacer(),
        ]),
      ),
    );
  }

  List<Widget> pages = [
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.pudina,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.chilli1,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        Image.asset(
          AppAssets.Jalapeno_pizza_1,
          height: 250.h,
          width: 250.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.corienderleaf,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.potato,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "ENJOY ",
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSize.largeFontSize,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "DELICIOUS FOOD",
                style: TextStyle(
                  color: FoodiesColors.primaryColor,
                  fontSize: FontSize.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " IN YOUR HEALTHY LIFE.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSize.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            "There are many variations of passages of Lorem ipsum available, but the majority have suffered alteration in some form, by injected humour",
            style: TextStyle(fontSize: FontSize.smallBodyText),
          ),
        )
      ],
    ),
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.souce1,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.souce2,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        Image.asset(
          AppAssets.noodles1,
          height: 250.h,
          width: 250.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.onion,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.souce3,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "PICK ",
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSize.largeFontSize,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " THE FOOD",
                style: TextStyle(
                  color: FoodiesColors.primaryColor,
                  fontSize: FontSize.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            "Praesent auctor, elit ut consequat vulputate, ipsum odio venenatis massa, vel finibus metus tortor eget nunc.Sed auctor eget purus non interdum. Nullam id metus at elit cursus hendrerit nec in ex.",
            style: TextStyle(fontSize: FontSize.smallBodyText),
          ),
        )
      ],
    ),
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.eggroll,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.fingerchips1,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        Image.asset(
          AppAssets.foods4,
          height: 250.h,
          width: 250.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.fingerchips2,
              height: 100.h,
              width: 150.w,
            ),
            Image.asset(
              AppAssets.seak1,
              height: 100.h,
              width: 150.w,
            ),
          ],
        ),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "EAT,",
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSize.largeFontSize,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " Love,",
                style: TextStyle(
                  color: FoodiesColors.primaryColor,
                  fontSize: FontSize.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " Repeat ",
                style: TextStyle(
                  fontSize: FontSize.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            "Eat, Love, Repeat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, quam non cursus aliquet, urna nisi commodo turpis, vel commodo risus orci ac massa. Nulla facilisi. Nullam aliquam dapibus metus a viverra. Fusce ut risus eu felis congue sagittis eget non lacus.",
            style: TextStyle(fontSize: FontSize.smallBodyText),
          ),
        )
      ],
    ),
  ];
}
