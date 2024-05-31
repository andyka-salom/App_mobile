import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Import untuk mengatur border radius

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
    return ClipRRect(
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
        backgroundColor: Colors.white, // Warna background
        elevation: 10.0, // Elevation untuk menampilkan shadow
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
