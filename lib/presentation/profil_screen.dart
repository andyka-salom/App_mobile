import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart'; // ignore_for_file: must_be_immutable

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 67.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftBlack900,
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                        margin: EdgeInsets.only(top: 2.v),
                        onTap: () {
                          onTapImgArrowleftone(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          bottom: 4.v,
                        ),
                        child: Text(
                          "Profile",
                          style: theme.textTheme.headlineMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildColumnAvatar(context),
              SizedBox(height: 12.v),
              _buildWidget(context),
              SizedBox(height: 55.v),
              _buildRowAccount(context),
              SizedBox(height: 24.v),
              _buildRowAccountOne(context),
              SizedBox(height: 5.v)
            ],
          ),
        ),
        bottomNavigationBar: _buildBottombar(context),
      ),
    );
  }

Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Service:
        return "/";
      case BottomBarEnum.Order:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.Profile;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.Profile:
        return ProfilScreen();
      default:
        return DefaultWidget(); // Here is where the error occurred
    }
  }
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





  /// Section Widget
  Widget _buildColumnAvatar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 120.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillBlue50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          CustomImageView(
            imagePath: ImageConstant.imgAvatar118x118,
            height: 118.adaptSize,
            width: 118.adaptSize,
            radius: BorderRadius.circular(
              59.h,
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Andrew Michel",
              style: CustomTextStyles.headlineSmallBold,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.h),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.outlineOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 63.adaptSize,
            width: 63.adaptSize,
            margin: EdgeInsets.only(bottom: 11.v),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 63.adaptSize,
                    width: 63.adaptSize,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      backgroundColor: appTheme.whiteA700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      right: 3.h,
                      bottom: 1.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "76%",
                          style: CustomTextStyles.titleMediumRobotoBlack900,
                        ),
                        SizedBox(height: 3.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 4.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Completion",
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 10.v),
                Text(
                  "5 Details Remaining",
                  style: CustomTextStyles.titleSmallBlack900,
                ),
                SizedBox(height: 10.v),
                Text(
                  "Updated 3 days ago",
                  style: CustomTextStyles.bodyMediumGray600,
                )
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.only(bottom: 62.v),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowAccount(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.h),
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineGray30077.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 12.v),
                Text(
                  "Personal Info, Profile Picture",
                  style: CustomTextStyles.bodyMedium14,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 19.v),
            child: CustomIconButton(
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgVector,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowAccountOne(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.h),
      padding: EdgeInsets.symmetric(vertical: 19.v),
      decoration: AppDecoration.outlineGray30077.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Service Set-up",
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 8.v),
                SizedBox(
                  width: 239.h,
                  child: Text(
                    "Mention your  job - experience, Project work and certification",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMedium14.copyWith(
                      height: 1.43,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 39.v),
            child: CustomIconButton(
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgVector,
              ),
            ),
          )
        ],
      ),
    );
  }


  /// Navigates back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }

