import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable


class ServiceAddScreen extends StatelessWidget {
  ServiceAddScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController locationEditTextController = TextEditingController();

  TextEditingController serviceTitleEditTextController =
      TextEditingController();

  TextEditingController serviceDescriptionEditTextController =
      TextEditingController();

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
            padding: EdgeInsets.only(top: 25.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 19.v,
                    ),
                    decoration: AppDecoration.fillBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                            "Service Details",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: 29.v),
                        _buildServiceRow(context),
                        SizedBox(height: 24.v),
                        _buildNameEditText(context),
                        SizedBox(height: 24.v),
                        _buildLocationEditText(context),
                        SizedBox(height: 24.v),
                        _buildServiceDescriptionEditText(context),
                        SizedBox(height: 39.v),
                      ],
                    ),
                  ),
                  SizedBox(height: 46.v),
                  _buildSaveContinueButton(context),
                  SizedBox(height: 34.v),
                  Text(
                    "Skip For Now",
                    style: CustomTextStyles.titleLargeIndigoA200,
                  )
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
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftBlack900,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 14.v,
          bottom: 14.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarTitle(
        text: "Setup Your Service",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildServiceRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.outlineIndigoAF.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            child: Text(
              "Service Categroy",
              style: theme.textTheme.titleMedium,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
      controller: nameEditTextController,
      hintText: "Company Name",
      prefix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgAppartment2,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 66.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 24.v,
        right: 30.h,
        bottom: 24.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildLocationEditText(BuildContext context) {
    return CustomTextFormField(
      controller: locationEditTextController,
      hintText: "Location",
      prefix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgSearch,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 66.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 24.v,
        right: 30.h,
        bottom: 24.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildServiceTitleEditText(BuildContext context) {
    return CustomTextFormField(
      controller: serviceTitleEditTextController,
      hintText: "Service Title (Ex. Designer )",
      prefix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgWork,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 66.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 24.v,
        right: 30.h,
        bottom: 24.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildServiceDescriptionEditText(BuildContext context) {
    return CustomTextFormField(
      controller: serviceDescriptionEditTextController,
      hintText: "Service Description ( Optional )",
      textInputAction: TextInputAction.done,
      maxLines: 9,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 20.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGrayTL30,
    );
  }

  /// Section Widget
  Widget _buildSaveContinueButton(BuildContext context) {
    return CustomElevatedButton(
      height: 60.v,
      text: "Save & Continue",
      margin: EdgeInsets.only(
        left: 15.h,
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
