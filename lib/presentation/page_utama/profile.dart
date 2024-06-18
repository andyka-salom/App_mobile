import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../../core/app_export.dart';
// import '../serviceadd.dart';
// import '../personal_info_page_screen.dart';
// import '../page_utama/history.dart';
// import '../page_utama/home.dart';
// import '../page_utama/service.dart';
import '../../config.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final SharedPreferences prefs = snapshot.data!;
              final String? name = prefs.getString('username');
              final String? photoPath = prefs.getString('photoUrl');

              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: photoPath != null
                              ? NetworkImage('${Config.profilePhotoUrl}${photoPath}')
                              : AssetImage('assets/images/default_photo.jpg') as ImageProvider<Object>,
                        ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        name ?? "Anonymous",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    _buildProfileDetails(
                      context,
                      onTap: () => Navigator.pushNamed(context, '/personal_info'),
                      title: "Account",
                      description: "Personal Info, Profile Picture",
                      icon: Icons.person,
                    ),
                    SizedBox(height: 24),
                    _buildProfileDetails(
                      context,
                      onTap: () => Navigator.pushNamed(context, '/serviceadd'),
                      title: "Service Set-up",
                      description: "Mention your job - experience, Project work and certification",
                      icon: Icons.settings,
                    ),
                    SizedBox(height: 24),
                    _buildLogoutButton(context),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileDetails(
    BuildContext context, {
    required VoidCallback onTap,
    required String title,
    required String description,
    required IconData icon,
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
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blueAccent),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: Color(0xFF888888)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _logout(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: Colors.redAccent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/splash_screen');
  }
}
