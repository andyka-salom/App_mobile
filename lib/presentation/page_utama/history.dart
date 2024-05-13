import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
// import '../../../widgets/app_bar/appbar_leading_image.dart';
// import '../../../widgets/app_bar/appbar_title.dart';
// import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';

class OrderRecentScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              _buildProfileDetails(context),
              SizedBox(height: 15.v),
              // Add other profile details here
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2, // Indeks untuk OrderRecentScreen
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
      title: Text('Order History'),
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

  Widget _buildProfileDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadius.circular(15.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              SizedBox(width: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Andrew Michel",
                    style: CustomTextStyles.bodyMediumGray800.copyWith(
                      color: appTheme.indigoA200,
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Text(
                    "Sr. Android Developer at",
                    style: CustomTextStyles.bodyMedium14_1,
                  ),
                  Text(
                    "Poler Web-design",
                    style: CustomTextStyles.bodyMediumIndigoA200,
                  ),
                  SizedBox(height: 8.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLinkIc,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                      ),
                      SizedBox(width: 8.h),
                      Text(
                        "2k+ Connection",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: appTheme.blueGray600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 23.v),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 28.h,
      backgroundImage: AssetImage('assets/images/img_avatar_56x56.png'),
      backgroundColor: Colors.grey, // Default color if image is not available
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildButton(context, "Done", () {
          // Add logic for "Done" button here
        }),
        SizedBox(width: 9.h),
        _buildButton(context, "Detail", () {
          // Add logic for "Detail" button here
        }),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return CustomElevatedButton(
      width: 92.h,
      text: text,
      buttonTextStyle: theme.textTheme.titleMedium!.copyWith(
        color: Colors.white, // Change text color to white
      ),
      onPressed: onPressed,
    );
  }

  // Method for navigating back
  void onTapArrowLeft(BuildContext context) {
    // Add logic for navigating back here
  }
}
