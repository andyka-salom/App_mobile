import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/signin_screen_one_screen.dart';
import '../presentation/signup_page_one_screen.dart';
import '../presentation/splash_screen.dart'; // ignore_for_file: must_be_immutable


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String signinScreenOneScreen = '/signin_screen_one_screen';

  static const String signupPageOneScreen = '/signup_page_one_screen';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signinScreenOneScreen: (context) => SigninScreenOneScreen(),
    signupPageOneScreen: (context) => SignupPageOneScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => SplashScreen()
  };
}
