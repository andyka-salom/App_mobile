import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart'; 

class ServiceCategoryScreen extends StatefulWidget {
  ServiceCategoryScreen({Key? key}) : super(key: key);

  @override
  _ServiceCategoryScreenState createState() => _ServiceCategoryScreenState();
}

class _ServiceCategoryScreenState extends State<ServiceCategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  String? selectedCategory; // variable to store the selected category

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 43),
                _buildHeader(context),
                SizedBox(height: 34),
                CustomSearchView(
                  controller: searchController,
                  hintText: "Search",
                ),
                SizedBox(height: 25),
                _buildCategoryList(context),
                SizedBox(height: 80), // added space for the bottom button
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildSaveButton(context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgArrowLeftBlack900,
          height: 40,
          width: 28,
          onTap: () => onTapImgArrowLeft(context),
        ),
        const SizedBox(width: 16),
        Text(
          "Category",
          style: theme.textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return Column(
      children: categories.map((category) {
        return RadioListTile(
          title: Text(category),
          value: category,
          groupValue: selectedCategory,
          onChanged: (String? value) {
            setState(() {
              selectedCategory = value;
            });
          },
        );
      }).toList(),
    );
  }

 Widget _buildSaveButton(BuildContext context) {
  return CustomElevatedButton(
    height: 50,
    text: "Save",
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    buttonStyle: CustomButtonStyles.outlineBlue,
    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
    onPressed: () {
      // Perform action on save button click
    },
  );
}


  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  static const List<String> categories = [
    "Architecture",
    "Advertising Service",
    "Hospital & Healthcare",
    "Information Technology",
    "Food Services",
    "Fitness Services",
  ];
}
