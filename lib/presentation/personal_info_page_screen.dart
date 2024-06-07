import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';

class User {
  final int id;
  final String username;
  final String email;
  final String token;
  final String photoUrl;
  final String? mobile;
  final String? postalCode;
  final String? city;
  final String? address;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.photoUrl,
    this.mobile,
    this.postalCode,
    this.city,
    this.address,
  });
}

class PersonalInfoPageScreen extends StatefulWidget {
  PersonalInfoPageScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoPageScreenState createState() => _PersonalInfoPageScreenState();
}

class _PersonalInfoPageScreenState extends State<PersonalInfoPageScreen> {
  TextEditingController userSixController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController inputBoxOneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SharedPreferences? _prefs;
  String? profilePhotoUrl;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      userSixController.text = _prefs?.getString('username') ?? '';
      emailController.text = _prefs?.getString('email') ?? '';
      mobileNumberController.text = _prefs?.getString('mobile') ?? '';
      pincodeController.text = _prefs?.getString('postalCode') ?? '';
      inputBoxOneController.text = _prefs?.getString('city') ?? '';
      nameController.text = _prefs?.getString('address') ?? '';
      profilePhotoUrl = _prefs?.getString('photoUrl');
    });
  }

  Future<void> _saveUserDataToPrefs(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('id', user.id);
      prefs.setString('username', user.username);
      prefs.setString('email', user.email);
      prefs.setString('token', user.token);
      prefs.setString('photoUrl', user.photoUrl);
      prefs.setString('mobile', user.mobile ?? '');
      prefs.setString('postalCode', user.postalCode ?? '');
      prefs.setString('city', user.city ?? '');
      prefs.setString('address', user.address ?? '');
    } catch (e) {
      print('Error saving user data to SharedPreferences: $e');
    }
  }

  _submitData() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Save Changes"),
          content: Text("Do you want to save the changes?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                await _updateUserData(); // Update SharedPreferences
                await _sendDataToApi(); // Send data to API
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _updateUserData() async {
    // Construct User object with updated data
    User updatedUser = User(
      id: _prefs?.getInt('id') ?? 0, // Assuming 0 is not a valid ID
      username: userSixController.text,
      email: emailController.text,
      token: _prefs?.getString('token') ?? '',
      photoUrl: _prefs?.getString('photoUrl') ?? '',
      mobile: mobileNumberController.text,
      postalCode: pincodeController.text,
      city: inputBoxOneController.text,
      address: nameController.text,
    );

    // Save updated data to SharedPreferences
    await _saveUserDataToPrefs(updatedUser);
  }

_sendDataToApi() async {
  final userId = _prefs?.getInt('id') ?? 0;

  // Konversi id menjadi integer
  final intId = int.tryParse(userId.toString()) ?? 0;

  final data = {
    'username': userSixController.text,
    'email': emailController.text,
    'mobileNumber': mobileNumberController.text,
    'pincode': pincodeController.text,
    'city': inputBoxOneController.text,
    'address': nameController.text,
    'id': intId, // Memasukkan id sebagai integer ke dalam data
  };

  print('Sending data to API: $data'); // Print the data before sending

  final response = await http.put(
    Uri.parse('http://10.0.2.2:5000/users/1'), // Menggunakan intId dalam URL
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_prefs?.getString('token') ?? ''}',
    },
    body: json.encode(data),
  );

  if (response.statusCode == 200) {
    print('Data successfully saved on the server.');
  } else {
    print('Failed to save data on the server. Status code: ${response.statusCode}, Response body: ${response.body}');
  }
}




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
                            imagePath: profilePhotoUrl ?? ImageConstant.imgAvatar,
                            height: 132.adaptSize,
                            width: 132.adaptSize,
                            radius: BorderRadius.circular(66.h),
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
                    userSixController.text,
                    style: CustomTextStyles.headlineSmallBold,
                  ),
                  SizedBox(height: 15.v),

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
        text: "Account Details",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

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
      onPressed: _submitData,
    );
  }

  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
