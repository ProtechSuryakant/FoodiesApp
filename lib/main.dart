import 'package:flutter/material.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/app/theme/themes.dart';
import 'package:foodies_app/controllers/dependencyInjection.dart';
import 'package:foodies_app/pages/aboutus.dart';
import 'package:foodies_app/pages/addressbook..dart';
import 'package:foodies_app/pages/checkOutPage.dart';
import 'package:foodies_app/pages/feedback.dart';

import 'package:foodies_app/pages/foodDetails.dart';
import 'package:foodies_app/pages/menuPage.dart';
import 'package:foodies_app/pages/onboardScreen.dart';
import 'package:foodies_app/pages/profileEdit.dart';
import 'package:foodies_app/pages/splashScreeen.dart';
import 'package:foodies_app/pages/support.dart';
import 'package:foodies_app/pages/unknownScreen.dart';
import 'package:foodies_app/screens/auth/changePassword.dart';
import 'package:foodies_app/screens/auth/forgot.dart';
import 'package:foodies_app/screens/auth/forgotOtp.dart';
import 'package:foodies_app/screens/auth/login_with_number.dart';
import 'package:foodies_app/screens/auth/otpVerification.dart';
import 'package:foodies_app/screens/auth/signUp.dart';
import 'package:foodies_app/screens/mainHome/home/Home.dart';
import 'package:foodies_app/screens/mainHome/mainHome.dart';
import 'package:foodies_app/screens/mainHome/newsBlog/newsandblog.dart';
import 'package:foodies_app/screens/mainHome/orderDetails/orderDetails.dart';
import 'package:foodies_app/screens/mainHome/profile/profile.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          defaultTransition: Transition.rightToLeft,
          getPages: [
            GetPage(
              name: AppRoutes.splash,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: AppRoutes.onBoarding,
              page: () => const OnBoardScreen(),
            ),
            GetPage(
              name: AppRoutes.loginNumber,
              page: () => const LoginWithNumber(),
            ),
            GetPage(name: AppRoutes.home, page: () => const Home()),
            GetPage(
                name: AppRoutes.orderDetails, page: () => const OrderDetails()),
            GetPage(
              name: AppRoutes.checkOutDetails,
              page: () => const CheckOutPage(),
            ),
            GetPage(
              name: AppRoutes.newsnadblog,
              page: () => const NewsAndBlog(),
            ),
            GetPage(
              name: AppRoutes.profile,
              page: () => const ProfileScreen(),
            ),
            GetPage(
              name: AppRoutes.profileEdit,
              page: () => const ProfileEdit(),
            ),
            GetPage(
              name: AppRoutes.addressbook,
              page: () => const AddressBook(),
            ),
            GetPage(
              name: AppRoutes.feedback,
              page: () => const FeedbackScreen(),
            ),
            GetPage(
              name: AppRoutes.aboutus,
              page: () => const AboutUs(),
            ),
            GetPage(
              name: AppRoutes.supportUs,
              page: () => SupportPage(),
            ),
            GetPage(
              name: AppRoutes.menuPage,
              page: () => const MenuPage(),
            ),
            GetPage(
                name: AppRoutes.otpVerification,
                page: () => const OTPVerification()),
            GetPage(
              name: AppRoutes.forgotPass,
              page: () => const ForgotPassword(),
            ),
            GetPage(
              name: AppRoutes.forgotOtp,
              page: () => const ForgotOtp(),
            ),
            GetPage(
              name: AppRoutes.changePass,
              page: () => const ChangePassword(),
            ),
            GetPage(
              name: AppRoutes.signUp,
              page: () => const SignUp(),
            ),
            GetPage(
              name: AppRoutes.homeMain,
              page: () => const MainHome(),
            ),
            GetPage(
              name: AppRoutes.foodDetails,
              page: () => const FoodDetails(),
            ),
          ],
          unknownRoute: GetPage(
            name: "/unknown",
            page: () => const UnknownScreen(),
          ),
        );
      },
    );
  }
}
