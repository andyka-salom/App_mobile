import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart';
class ServiceAddScreen extends StatefulWidget {
  ServiceAddScreen({Key? key}) : super(key: key);

  @override
  _ServiceAddScreenState createState() => _ServiceAddScreenState();
}

class _ServiceAddScreenState extends State<ServiceAddScreen> {
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceDescriptionController = TextEditingController();
 late int userId;
  List<Category> categories = []; // List to store categories
  Category? selectedCategory; // Selected category

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Call a method to get the user ID from SharedPreferences
    _getUserID();
    _fetchCategories();
  }

  Future<void> _getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the user ID from SharedPreferences
    userId = prefs.getInt('user_id') ?? 1; // Default to 1 if not found
  }
  // Function to fetch categories from API
  Future<void> _fetchCategories() async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/product-categories'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        categories = data.map((category) => Category.fromJson(category)).toList();
      });
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load categories');
    }
  }

void _saveDataAndContinue() {
  if (_formKey.currentState!.validate()) {
    // Validate form fields
    final Map<String, dynamic> data = {
      "Name": serviceNameController.text,
      "category_id": selectedCategory?.id,
      "user_id": userId, // Use the retrieved user ID
      "Price": double.parse(priceController.text), 
      "Deskripsi": serviceDescriptionController.text,
    };

    // Print data before sending to API
    // print('Data to be sent: $data');

    // Send data to API
    _sendDataToAPI(data);
  }
}


Future<void> _sendDataToAPI(Map<String, dynamic> data) async {
  try {
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/products'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Data saved successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navbar');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save data: ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print('Response body: ${response.body}');
    }
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Error saving data: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    print('Error saving data: $e');
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
                      _buildServiceNameTextField(context),
                      SizedBox(height: 24.v),
                      _buildPriceTextField(context),
                      SizedBox(height: 24.v),
                      _buildServiceDescriptionTextField(context),
                      SizedBox(height: 39.v),
                    ],
                  ),
                ),
                SizedBox(height: 46.v),
                _buildSaveContinueButton(context),
                SizedBox(height: 34.v),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/navbar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(0, 194, 188, 188),
                      elevation: 0,
                    ),
                    child: Text(
                      "Skip For Now",
                      style: CustomTextStyles.titleLargeIndigoA200,
                    ),
                  )
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
        text: "Setup Your Service",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

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
              "Service Category",
              style: theme.textTheme.titleMedium,
            ),
          ),
          DropdownButton<Category>(
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue;
              });
            },
            items: categories.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildServiceNameTextField(BuildContext context) {
    return CustomTextFormField(
      controller: serviceNameController,
      hintText: "Service Name",
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

Widget _buildPriceTextField(BuildContext context) {
    return CustomTextFormField(
      controller: priceController,
      hintText: "Price",
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


  Widget _buildServiceDescriptionTextField(BuildContext context) {
    return CustomTextFormField(
      controller: serviceDescriptionController,
      hintText: "Service Description (Optional)",
      textInputAction: TextInputAction.done,
      maxLines: 9,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 20.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGrayTL30,
    );
  }

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
      onPressed: _saveDataAndContinue, // Call save function when button is pressed
    );
  }

  void onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

