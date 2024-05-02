import 'package:flutter/material.dart';
import '../presentation/page_utama/login.dart';
import '../presentation/page_utama/registrasi.dart';
import '../presentation/personal_info_page_screen.dart';
import '../presentation/page_utama/profile.dart';
import '../presentation/serviceadd.dart';
import '../presentation/service_category.dart';
import '../presentation/detail_order_screen.dart';
import '../presentation/page_utama/history.dart';
import '../presentation/order_screen.dart';
import '../presentation/page_utama/splash_screen.dart'; 
import '../presentation/page_utama/service.dart';
import '../presentation/page_utama/home.dart';


class AppRoutes {

  // Page Utama
  static const String splashScreen = '/splash_screen'; // Halaman awal
  static const String signinScreenOneScreen = '/signin_screen_one_screen'; // Halaman login
  static const String signupPageOneScreen = '/signup_page_one_screen'; // Halaman register
  static const String service_page = '/service_page'; // Halaman service
  static const String Profile = '/profil'; // Halaman Profil
  static const String orderRecentScreen = '/order_recent_screen'; // Halaman History
  static const String homepage = "/home"; // Halaman home
  // End Page Utama

  static const String orderscreen = '/order_screen';
  static const String newPage = '/detail_order';
  static const String initialRoute = '/initialRoute';
  static const String serviceContainerScreen = '/service_container_screen';

  static Map<String, WidgetBuilder> routes = {
    // Halaman utama
    splashScreen: (context) => SplashScreen(),
    signinScreenOneScreen: (context) => SigninScreenOneScreen(),
    Profile: (context) => ProfilScreen(), 
    orderRecentScreen: (context) => OrderRecentScreen(),
    signupPageOneScreen: (context) => SignupPageOneScreen(),
    service_page: (context) => ServicePage(),
    homepage: (context) => HomePage(),
    // End Halaman utama

    orderscreen: (context) => OrderScreen(),
    '/personal_info': (context) => PersonalInfoPageScreen(),
    '/serviceadd': (context) => ServiceAddScreen(),
    '/servicecategory': (context) => ServiceCategoryScreen(),
    '/detail_order': (context) => DetailOrderScreen(), 
    
    initialRoute: (context) => ServicePage()
  };
}
