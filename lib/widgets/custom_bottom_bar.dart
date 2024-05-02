import 'package:flutter/material.dart';
import '../core/app_export.dart';


enum BottomBarEnum { Home, Service, Order, Profile }
// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavService,
      activeIcon: ImageConstant.imgNavService,
      title: "Service",
      type: BottomBarEnum.Service,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavOrder,
      activeIcon: ImageConstant.imgNavOrder,
      title: "Order",
      type: BottomBarEnum.Order,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103.v,
      decoration: BoxDecoration(
        color: appTheme.gray50,
        borderRadius: BorderRadius.circular(15.h),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: buildMenuItem(
              index,
              bottomMenuList[index].icon,
              appTheme.gray600,
            ),
            activeIcon: buildMenuItem(
              index,
              bottomMenuList[index].activeIcon,
              appTheme.blueA700,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            widget.onChanged?.call(bottomMenuList[index].type);
          });

          // Navigate to the corresponding page
          // switch (bottomMenuList[index].type) {
          //   case BottomBarEnum.Home:
          //     Navigator.pushNamed(context, AppRoutes.homePage);
          //     break;
          //   case BottomBarEnum.Service:
          //     Navigator.pushNamed(context, AppRoutes.service_page);
          //     break;
          //   case BottomBarEnum.Order:
          //     Navigator.pushNamed(context, AppRoutes.orderRecentScreen);
          //     break;
          //   case BottomBarEnum.Profile:
          //     Navigator.pushNamed(context, AppRoutes.Profile);
          //     break;
          // }
        },
      ),
    );
  }

  Widget buildMenuItem(int index, String iconPath, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: iconPath,
          height: 28.adaptSize,
          width: 28.adaptSize,
          color: iconColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.v),
          child: Text(
            bottomMenuList[index].title ?? "",
            style: TextStyle(
              color: index == selectedIndex
                  ? theme.colorScheme.primary
                  : appTheme.gray50001,
            ),
          ),
        )
      ],
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

