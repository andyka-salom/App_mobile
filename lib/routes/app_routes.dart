import 'package:flutter/material.dart';
import '../presentation/page_utama/login.dart';
import '../presentation/page_utama/registrasi.dart';
import '../presentation/personal_info_page_screen.dart';
import '../presentation/page_utama/history.dart' as HistoryPage;
import '../presentation/page_utama/splash_screen.dart'; 
import '../presentation/page_utama/service.dart';
import '../presentation/page_utama/home.dart';
import '../presentation/navbar.dart';
import '../presentation/serviceadd.dart';
import '../presentation/page_utama/profile.dart'; 


class AppRoutes {

  // Page Utama
  static const String splashScreen = '/splash_screen'; // Halaman awal
  static const String signinScreenOneScreen = '/signin_screen_one_screen'; // Halaman login
  static const String signupPageOneScreen = '/signup_page_one_screen'; // Halaman register
  static const String service_page = '/service_page'; // Halaman service
  static const String profile = '/profil'; // Halaman Profil
  static const String orderRecentScreen = '/order_recent_screen'; // Halaman History
  static const String homepage = "/home"; // Halaman home
  // End Page Utama

  static const String navbar = "/navbar";
  static const String payment = "/payment";
  static const String orderscreen = '/order_screen';
  static const String newPage = '/detail_order';
  static const String initialRoute = '/initialRoute';
  static const String serviceContainerScreen = '/service_container_screen';
  static const String serviceadd  = '/serviceadd';

  static Map<String, WidgetBuilder> routes = {
    // Halaman utama
    splashScreen: (context) => SplashScreen(),
    signinScreenOneScreen: (context) => SigninScreenOneScreen(),
    profile: (context) => ProfileScreen(), 
    orderRecentScreen: (context) => HistoryPage.OrderRecentScreen(),
    signupPageOneScreen: (context) => SignupPageOneScreen(),
    service_page: (context) => ServicePage(),
    homepage: (context) => HomePage(),
    navbar: (context) => NavBarPage(),
    serviceadd: (context) => ServiceAddScreen(),
    '/personal_info': (context) => PersonalInfoPageScreen(),
    
    initialRoute: (context) => NavBarPage(),
  };
}
