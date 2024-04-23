import 'package:flutter/material.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/signin_screen_one_screen.dart';
import '../presentation/signup_page_one_screen.dart';
import '../presentation/personal_info_page_screen.dart';
import '../presentation/profil_screen.dart';
import '../presentation/serviceadd.dart';
import '../presentation/service_category.dart';
import '../presentation/detail_order_screen.dart';
import '../presentation/home_page/home_page.dart';
import '../presentation/service_container_screen/service_container_screen.dart';
import '../presentation/order_recent_screen.dart';
import '../presentation/splash_screen.dart'; // ignore_for_file: must_be_immutable


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String serviceTabContainerPage = '/service_tab_container_page';

  static const String signinScreenOneScreen = '/signin_screen_one_screen';

  static const String signupPageOneScreen = '/signup_page_one_screen';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String newPage = '/detail_order';

  static const String ServicePage = '/service_page';

  static const String orderRecentScreen = '/order_recent_screen';

  static const String initialRoute = '/initialRoute';

    static const String serviceContainerScreen = '/service_container_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signinScreenOneScreen: (context) => SigninScreenOneScreen(),
     '/personal_info': (context) => PersonalInfoPageScreen(),
     '/profil': (context) => ProfilScreen(),
     '/serviceadd': (context) => ServiceAddScreen(),
     '/servicecategory': (context) => ServiceCategoryScreen(),
     '/detail_order': (context) => DetailOrderScreen(), 
     '/home_page': (context) => HomePage(), //ganti dengan yg baru
    orderRecentScreen: (context) => OrderRecentScreen(),
        serviceContainerScreen: (context) => ServiceContainerScreen(),
    signupPageOneScreen: (context) => SignupPageOneScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    initialRoute: (context) => ServiceContainerScreen()
  };
}
