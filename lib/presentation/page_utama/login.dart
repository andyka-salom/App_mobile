import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/app_export.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable
class User {
  final int id;
  final String username;
  final String email;
  final String token;
  final String photoUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      token: json['token'],
      photoUrl: json['user']['photo_url'],
    );
  }
}

class SigninScreenOneScreen extends StatelessWidget {
  SigninScreenOneScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool keepMeSignedIn = false;
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
                  top: 166.v,
                  right: 16.h,
                ),
                child: Column(
                  children: [
                    Text(
                      "Sign in",
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 32.v),
                    _buildSigninForm(context),
                    SizedBox(height: 16.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtDonthaveanaccount(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account ?",
                              style: CustomTextStyles.bodyLargeGray50001,
                            ),
                            TextSpan(
                              text: "  ",
                            ),
                            TextSpan(
                              text: "Sign up",
                              style: CustomTextStyles.titleLargePrimary,
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
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
  Widget _buildSigninForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
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
          SizedBox(height: 24.v),
          CustomTextFormField(
            controller: passwordController,
            hintText: "Password",
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
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: CustomCheckboxButton(
              text: "Keep me signed in",
              value: keepMeSignedIn,
              padding: EdgeInsets.symmetric(vertical: 2.v),
              onChange: (value) {
                keepMeSignedIn = value;
              },
            ),
          ),
          SizedBox(height: 32.v),
          CustomElevatedButton(
            text: "Sign In",
            buttonTextStyle: CustomTextStyles.titleMediumOnPrimary18,
            onPressed: () {
              _submitLogin(context);
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the signupPageOneScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupPageOneScreen);
  }

User? loggedInUser; // Deklarasi variabel global

void _submitLogin(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/login'),
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      loggedInUser = User.fromJson(responseData); 
        print('User ID: ${loggedInUser!.id}');
        print('Username: ${loggedInUser!.username}');
        print('Email: ${loggedInUser!.email}');
        print('Token: ${loggedInUser!.token}');
        print('Photo URL: ${loggedInUser!.photoUrl}');// Menyimpan user yang masuk
      Navigator.pushReplacementNamed(context, '/home_page');
    } else {
            // Login failed, show an error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login failed. Please check your credentials.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    }
