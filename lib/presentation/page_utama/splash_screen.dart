import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 93.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OurTalent",
                style: CustomTextStyles.displayMediumBold,
              ),
              SizedBox(height: 16.v),
              Container(
                width: 310.h,
                margin: EdgeInsets.symmetric(horizontal: 42.h),
                child: Text(
                  "“Unleash talent, embrace freedom, thrive freelancing.”",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleLargeGray50001.copyWith(
                    height: 1.25,
                  ),
                ),
              ),
              SizedBox(height: 68.v),
              CustomImageView(
                imagePath: ImageConstant.imgIllustrationFinance,
                height: 311.v,
                width: 396.h,
              ),
              Spacer(),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                buttonTextStyle: CustomTextStyles.titleMediumOnPrimary18,
                onPressed: () {
                  onTapContinue(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the signinScreenOneScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signinScreenOneScreen);
  }
}
