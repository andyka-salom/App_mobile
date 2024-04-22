import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class PersonalInfoPageScreen extends StatelessWidget {
  PersonalInfoPageScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userSixController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController inputBoxOneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700, 
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 35.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.circleBorder72,
                    ),
                    child: Container(
                      height: 144.adaptSize,
                      width: 144.adaptSize,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 5.v,
                      ),
                      decoration: AppDecoration.gradientRedToGreenA.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder72,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgAvatar,
                            height: 132.adaptSize,
                            width: 132.adaptSize,
                            radius: BorderRadius.circular(
                              66.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomIconButton(
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            padding: EdgeInsets.all(2.h),
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgEditIc,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    "Mark Davin",
                    style: CustomTextStyles.headlineSmallBold,
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    "UI / UX Designer at Google Inc.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 26.v),
                  Divider(
                    color: appTheme.gray50001,
                    indent: 16.h,
                    endIndent: 16.h,
                  ),
                  SizedBox(height: 57.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text(
                        "Personal Info",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.v),
                  Divider(
                    indent: 32.h,
                    endIndent: 32.h,
                  ),
                  SizedBox(height: 25.v),
                  _buildUserSix(context),
                  SizedBox(height: 16.v),
                  _buildEmail(context),
                  SizedBox(height: 16.v),
                  _buildMobileNumber(context),
                  SizedBox(height: 16.v),
                  _buildInputBox(context),
                  SizedBox(height: 39.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text(
                        "Address",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.v),
                  Divider(
                    indent: 32.h,
                    endIndent: 32.h,
                  ),
                  SizedBox(height: 25.v),
                  _buildPincode(context),
                  SizedBox(height: 24.v),
                  _buildInputBoxOne(context),
                  SizedBox(height: 24.v),
                  _buildName(context),
                  SizedBox(height: 2.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame25346,
                    height: 34.v,
                    width: 428.h,
                  ),
                  _buildSave(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 107.v,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftBlack90032x32,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 24.v,
          bottom: 24.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarTitle(
        text: "Account Details",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserSix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: userSixController,
        hintText: "Mark Davin I",
        hintStyle: CustomTextStyles.titleMediumBluegray900,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgUser6,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email address",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgEnvelopeIc,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMobileNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: mobileNumberController,
        hintText: "Mobile Number",
        textInputType: TextInputType.phone,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgCallIc,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInputBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.h),
      padding: EdgeInsets.fromLTRB(30.h, 21.v, 30.h, 19.v),
      decoration: AppDecoration.outlineGray200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSearchGray500,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 5.v,
              bottom: 8.v,
            ),
            child: Text(
              "Gender",
              style: theme.textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPincode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: pincodeController,
        hintText: "Pincode",
        textInputType: TextInputType.number,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearchGray50032x32,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInputBoxOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: inputBoxOneController,
        hintText: "Landmark, Locality, Place...",
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgBuilding02,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: CustomTextFormField(
        controller: nameController,
        hintText: "Flat no., Street name, Area name..",
        textInputAction: TextInputAction.done,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgHouseIc,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
      height: 60.v,
      text: "Save",
      margin: EdgeInsets.only(
        left: 38.h,
        right: 25.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlue,
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}

