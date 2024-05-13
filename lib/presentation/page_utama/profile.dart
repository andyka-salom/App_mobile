import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';
import '../serviceadd.dart';
import '../personal_info_page_screen.dart';
import '../page_utama/history.dart';
import '../page_utama/home.dart';
import '../page_utama/service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final SharedPreferences prefs = snapshot.data!;
              final String? name = prefs.getString('username'); // Mengambil nama dari SharedPreferences
              final String? photoPath = prefs.getString('photoUrl'); // Mengambil foto dari SharedPreferences

              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.v),
                    Center(
                      child: CircleAvatar(
                        radius: 59.h,
                        backgroundImage: photoPath != null
                            ? NetworkImage(photoPath) // Gunakan NetworkImage untuk URL gambar
                            : AssetImage('assets/images/default_photo.jpg') as ImageProvider<Object>,
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Center(
                      child: Text(
                        name ?? "Anonymousss",
                        style: CustomTextStyles.headlineSmallBold,
                      ),
                    ),
                    SizedBox(height: 40.v),
                    _buildProfileDetails(
                      context,
                      onTap: () => Navigator.pushNamed(context, '/personal_info'),
                      title: "Account",
                      description: "Personal Info, Profile Picture",
                    ),
                    SizedBox(height: 24.v),
                    _buildProfileDetails(
                      context,
                      onTap: () => Navigator.pushNamed(context, '/serviceadd'),
                      title: "Service Set-up",
                      description: "Mention your job - experience, Project work and certification",
                    ),
                  ],
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3, // Indeks untuk ProfileScreen
          selectedItemColor: Colors.blue, // Warna biru untuk item yang dipilih
          unselectedItemColor: Colors.grey, // Warna abu-abu untuk item yang tidak dipilih
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Order History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/service_page');
              break;
            case 2:
              Navigator.pushNamed(context, '/order_recent_screen');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
            }
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Profile'),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowLeftBlack90032x32,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails(
    BuildContext context, {
    required VoidCallback onTap,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.titleMediumBlack900,
            ),
            SizedBox(height: 12.v),
            Text(
              description,
              style: CustomTextStyles.bodyMedium14,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => ProfileScreen(),
      '/personal_info': (context) => PersonalInfoPageScreen(),
      '/serviceadd': (context) => ServiceAddScreen(),
      '/order_recent_screen': (context) => OrderRecentScreen(),
      '/service_page': (context) => ServicePage(),
      '/profile': (context) => ProfileScreen(),
      '/home': (context) => HomePage(),
    },
  ));
}
