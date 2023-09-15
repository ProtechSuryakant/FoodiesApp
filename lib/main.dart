import 'package:flutter/material.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/app/theme/themes.dart';
import 'package:foodies_app/controllers/dependencyInjection.dart';
import 'package:foodies_app/controllers/themeControllers.dart';
import 'package:foodies_app/pages/onboardScreen.dart';
import 'package:foodies_app/pages/splashScreeen.dart';
import 'package:foodies_app/pages/unknownScreen.dart';
import 'package:foodies_app/screens/auth/changePassword.dart';
import 'package:foodies_app/screens/auth/forgot.dart';
import 'package:foodies_app/screens/auth/forgotOtp.dart';
import 'package:foodies_app/screens/auth/login_with_number.dart';
import 'package:foodies_app/screens/auth/otpVerification.dart';
import 'package:foodies_app/screens/auth/signUp.dart';
import 'package:foodies_app/screens/mainHome/MainHome.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/main.dart';

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
            GetPage(
                name: AppRoutes.otpVerification, page: () => OTPVerification()),
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
              page: () => MainHome(),
            )
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
