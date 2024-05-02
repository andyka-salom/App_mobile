import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/app_export.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class SignupPageOneScreen extends StatelessWidget {
  SignupPageOneScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 126.v,
                  right: 16.h,
                ),
                child: Column(
                  children: [
                    Text(
                      "Sign up",
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 32.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                        vertical: 32.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildName(context),
                          SizedBox(height: 24.v),
                          _buildEmail(context),
                          SizedBox(height: 24.v),
                          _buildPassword(context),
                          SizedBox(height: 24.v),
                          _buildRememberMe(context),
                          SizedBox(height: 32.v),
                          _buildSignUp(context)
                        ],
                      ),
                    ),
                    SizedBox(height: 15.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account ?",
                              style: CustomTextStyles.bodyLargeGray50001,
                            ),
                            TextSpan(
                              text: "  ",
                            ),
                            TextSpan(
                              text: "Signin",
                              style:
                                  CustomTextStyles.titleLargeOnPrimaryContainer,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: CustomTextFormField(
        controller: nameController,
        hintText: "Name",
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
      padding: EdgeInsets.only(left: 2.h),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email",
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
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: CustomTextFormField(
        controller: passwordController,
        hintText: "Create Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 21.v, 16.h, 21.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgUnlockIc,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 74.v,
        ),
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildRememberMe(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h),
      child: CustomCheckboxButton(
        text: "Remember Me",
        value: rememberMe,
        padding: EdgeInsets.symmetric(vertical: 1.v),
        onChange: (value) {
          rememberMe = value;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      text: "Sign up",
      margin: EdgeInsets.only(
        left: 2.h,
        right: 3.h,
      ),
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary18,
      onPressed: () {
        _submitRegister(context);
      },
    );
  }

  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signinScreenOneScreen);
  }

  onTapTxtAlreadyhavean(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signinScreenOneScreen);
  }

  void _submitRegister(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // Perform registration API call
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/register'),
        body: json.encode({'username': name, 'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Registration successful, handle the response accordingly
        print('Registration successful');
        Navigator.pushReplacementNamed(context, '/signin_screen_one_screen');
      }else {
        // Registration failed, show an error message with API response
        final Map<String, dynamic> responseData = json.decode(response.body);
        String errorMessage = responseData['message'] ?? 'Registration failed. Please try again.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: const Color.fromARGB(255, 77, 76, 75),
          ),
        );
      }
    }
  }
}
