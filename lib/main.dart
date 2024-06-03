import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
// import 'presentation/navbar.dart';
// import 'package:andy_s_application2/presentation/page_utama/service.dart';
// import 'package:andy_s_application2/presentation/page_utama/home.dart';
// import 'package:andy_s_application2/presentation/page_utama/history.dart';
// import 'package:andy_s_application2/presentation/page_utama/profile.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'andy_s_application2',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}

// class AppRoutes {
//   static const String initialRoute = '/';
//   static const String service_page = '/service_page';
//   static const String profile = '/profile';
//   static const String orderRecentScreen = '/order_recent_screen';
//   static const String homepage = '/home';

//   static Map<String, WidgetBuilder> routes = {
//     initialRoute: (context) => NavBarPage(),
//     homepage: (context) => HomePage(),
//     service_page: (context) => ServicePage(),
//     orderRecentScreen: (context) => OrderRecentScreen(),
//     profile: (context) => ProfileScreen(),
//   };
// }

