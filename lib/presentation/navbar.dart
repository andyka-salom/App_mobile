import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../presentation/page_utama/home.dart';
import '../presentation/page_utama/service.dart';
import '../presentation/page_utama/history.dart';
import '../presentation/page_utama/profile.dart';

class NavBarPage extends StatefulWidget {
  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  late PageController _pageController;

  final List<Widget> _pages = [
    HomePage(),
    ServicePage(),
    OrderRecentScreen(),
    ProfileScreen(),
  ];

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          currentIndex: _currentPageIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_nav_service.svg',
                width: 24,
                height: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_nav_order.svg',
                width: 24,
                height: 24,
              ),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_timer_ic.svg',
                width: 24,
                height: 24,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_user6.svg',
                width: 24,
                height: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
