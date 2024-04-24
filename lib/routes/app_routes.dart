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
// import '../presentation/service_container_screen/service_container_screen.dart';
import '../presentation/order_recent_screen.dart';
import '../presentation/order_screen.dart';
import '../presentation/splash_screen.dart'; 


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String serviceTabContainerPage = '/service_tab_container_page';

  static const String signinScreenOneScreen = '/signin_screen_one_screen';

  static const String signupPageOneScreen = '/signup_page_one_screen';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String newPage = '/detail_order';

  static const String ServicePage = '/service_page'; //halaman service

  static const String Profile = '/profil'; //halaman service

  static const String orderscreen = '/order_screen';

  static const String orderRecentScreen = '/order_recent_screen'; //history order

  static const String initialRoute = '/initialRoute';

    static const String serviceContainerScreen = '/service_container_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signinScreenOneScreen: (context) => SigninScreenOneScreen(),
    orderscreen:(context) => OrderScreen(),
     '/personal_info': (context) => PersonalInfoPageScreen(),
     Profile: (context) => ProfilScreen(), //profil
     '/serviceadd': (context) => ServiceAddScreen(),
     '/servicecategory': (context) => ServiceCategoryScreen(),
     '/detail_order': (context) => DetailOrderScreen(), 
    homePage: (context) => HomePage(), //ganti dengan yg baru
    orderRecentScreen: (context) => OrderRecentScreen(),
        // serviceContainerScreen: (context) => ServiceContainerScreen(),
    signupPageOneScreen: (context) => SignupPageOneScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    initialRoute: (context) => SplashScreen()
  };
}
