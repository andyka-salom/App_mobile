import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'service_tab_container_page.dart'; // ignore_for_file: must_be_immutable


class OrderRecentScreen extends StatelessWidget {
  OrderRecentScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController profileDetailsColumnAndrewMicController =
      TextEditingController();

  TextEditingController profileDetailsColumnAndrewController =
      TextEditingController();

  TextEditingController profileDetailsColumnJosephDelController =
      TextEditingController();

  TextEditingController profileDetailsColumnMerdezdinController =
      TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                children: [
                  _buildProfiledetails(context),
                  SizedBox(height: 15.v),
                  _buildProfiledetails1(context),
                  SizedBox(height: 15.v),
                  _buildProfiledetails2(context),
                  SizedBox(height: 15.v),
                  _buildProfiledetails3(context)
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 15.v,
          bottom: 12.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarTitle(
        text: "Order Recent",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsColumnAndrewMic(BuildContext context) {
    return CustomTextFormField(
      controller: profileDetailsColumnAndrewMicController,
      hintText: "Andrew Michel",
    );
  }

  /// Section Widget
  Widget _buildDone(BuildContext context) {
    return CustomElevatedButton(
      width: 115.h,
      text: "Done",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCheckbigIc,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL22,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsButtonDetail(BuildContext context) {
    return CustomElevatedButton(
      width: 92.h,
      text: "Detail",
      margin: EdgeInsets.only(left: 9.h),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfiledetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgAvatar,
                height: 56.adaptSize,
                width: 56.adaptSize,
                radius: BorderRadius.circular(
                  28.h,
                ),
                margin: EdgeInsets.only(bottom: 35.v),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    top: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileDetailsColumnAndrewMic(context),
                      SizedBox(height: 14.v),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Sr. Android Developer at ",
                              style: CustomTextStyles.bodyMedium14_1,
                            ),
                            TextSpan(
                              text: "Poler Web-design",
                              style: CustomTextStyles.bodyMediumIndigoA200,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.v),
                      _buildRowlinkicThree(
                        context,
                        p2kconnection: "2k+ Connection",
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 23.v),
          Padding(
            padding: EdgeInsets.only(right: 23.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildDone(context),
                _buildProfileDetailsButtonDetail(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsColumnAndrew(BuildContext context) {
    return CustomTextFormField(
      controller: profileDetailsColumnAndrewController,
      hintText: "Andre Design Studio",
    );
  }

  /// Section Widget
  Widget _buildDone1(BuildContext context) {
    return CustomElevatedButton(
      width: 115.h,
      text: "Done",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCheckbigIc,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL22,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsButtonDetail1(BuildContext context) {
    return CustomElevatedButton(
      width: 92.h,
      text: "Detail",
      margin: EdgeInsets.only(left: 9.h),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfiledetails1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgALab,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.only(bottom: 122.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                top: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileDetailsColumnAndrew(context),
                  SizedBox(height: 11.v),
                  Container(
                    width: 270.h,
                    margin: EdgeInsets.only(right: 17.h),
                    child: Text(
                      "Working in Mobile apps, Web development, Graphic design ...",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMedium14.copyWith(
                        height: 1.43,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  _buildRowlinkicThree(
                    context,
                    p2kconnection: "2k+ Connection",
                  ),
                  SizedBox(height: 23.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildDone1(context),
                          _buildProfileDetailsButtonDetail1(context)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsColumnJosephDel(BuildContext context) {
    return CustomTextFormField(
      controller: profileDetailsColumnJosephDelController,
      hintText: "Joseph Delny",
    );
  }

  /// Section Widget
  Widget _buildDone2(BuildContext context) {
    return CustomElevatedButton(
      width: 115.h,
      text: "Done",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCheckbigIc,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL22,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsButtonDetail2(BuildContext context) {
    return CustomElevatedButton(
      width: 92.h,
      text: "Detail",
      margin: EdgeInsets.only(left: 9.h),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfiledetails2(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar56x56,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.only(bottom: 102.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                top: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileDetailsColumnJosephDel(context),
                  SizedBox(height: 14.v),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Jr. Software engineer at ",
                          style: CustomTextStyles.bodyMedium14_1,
                        ),
                        TextSpan(
                          text: "UI den stuio & labs",
                          style: CustomTextStyles.bodyMediumIndigoA200,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8.v),
                  _buildRowlinkicThree(
                    context,
                    p2kconnection: "2k+ Connection",
                  ),
                  SizedBox(height: 23.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildDone2(context),
                          _buildProfileDetailsButtonDetail2(context)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsColumnMerdezdin(BuildContext context) {
    return CustomTextFormField(
      controller: profileDetailsColumnMerdezdinController,
      hintText: "Merdez Diniz",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildDone3(BuildContext context) {
    return CustomElevatedButton(
      width: 115.h,
      text: "Done",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCheckbigIc,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL22,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfileDetailsButtonDetail3(BuildContext context) {
    return CustomElevatedButton(
      width: 92.h,
      text: "Detail",
      margin: EdgeInsets.only(left: 9.h),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Section Widget
  Widget _buildProfiledetails3(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgAvatar1,
                height: 56.adaptSize,
                width: 56.adaptSize,
                radius: BorderRadius.circular(
                  28.h,
                ),
                margin: EdgeInsets.only(bottom: 35.v),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    top: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileDetailsColumnMerdezdin(context),
                      SizedBox(height: 14.v),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Jr. Software engineer at ",
                              style: CustomTextStyles.bodyMedium14_1,
                            ),
                            TextSpan(
                              text: "UI den stuio & labs",
                              style: CustomTextStyles.bodyMediumIndigoA200,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.v),
                      _buildRowlinkicThree(
                        context,
                        p2kconnection: "2k+ Connection",
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 23.v),
          Padding(
            padding: EdgeInsets.only(right: 23.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildDone3(context),
                _buildProfileDetailsButtonDetail3(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  // /// Section Widget
  // Widget _buildBottomBar(BuildContext context) {
  //   return CustomBottomBar(
  //     onChanged: (BottomBarEnum type) {
  //       Navigator.pushNamed(
  //           navigatorKey.currentContext!, getCurrentRoute(type));
  //     },
  //   );
  // }

  /// Common widget
  Widget _buildRowlinkicThree(
    BuildContext context, {
    required String p2kconnection,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgLinkIc,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(top: 1.v),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8.h,
            bottom: 2.v,
          ),
          child: Text(
            p2kconnection,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.blueGray600,
            ),
          ),
        )
      ],
    );
  }

  // ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.serviceTabContainerPage;
  //     case BottomBarEnum.Service:
  //       return "/";
  //     case BottomBarEnum.Order:
  //       return "/";
  //     case BottomBarEnum.Profile:
  //       return "/";
  //     default:
  //       return "/";
  //   }
  // }

  ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.serviceTabContainerPage:
  //       return ServiceTabContainerPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
