import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';

// Buat kelas Category untuk merepresentasikan data kategori
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ServiceTabContainerScreen extends StatefulWidget {
  const ServiceTabContainerScreen({Key? key}) : super(key: key);

  @override
  _ServiceTabContainerScreenState createState() =>
      _ServiceTabContainerScreenState();
}

class _ServiceTabContainerScreenState extends State<ServiceTabContainerScreen>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabController;
  late List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 0, vsync: this);
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: categories.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.h),
                    child: CustomSearchView(
                      controller: searchController,
                      hintText: "Search Company, Job Profile, .......People",
                    ),
                  ),
                  SizedBox(height: 40.v),
                  _buildTabView(),
                ],
              ),
      ),
    );
  }

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 52.h,
    leading: AppbarLeadingImage(
      imagePath: ImageConstant.imgArrowLeft,
      margin: EdgeInsets.only(left: 10.h, top: 14.v, bottom: 13.v),
      onTap: () {
        onTapArrowLeftOne(context);
      },
    ),
    title: AppbarTitle(
      text: "Service",
      margin: EdgeInsets.only(left: 10.h),
    ),
  );
}

Widget _buildTabView() {
  return SizedBox(
    height: 44.v,
    width: 435.h,
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: appTheme.whiteA700,
          labelStyle: TextStyle(
            fontSize: 16.fSize,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: appTheme.indigoA200,
          unselectedLabelStyle: TextStyle(
            fontSize: 15.fSize,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.w600,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: appTheme.indigoA200,
            borderRadius: BorderRadius.circular(22.h),
          ),
          tabs: categories.map((category) {
            return Tab(
              child: Text(category.name),
            );
          }).toList(),
        ),
      ),
    ),
  );
}


  void _fetchCategories() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/product-categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Category> fetchedCategories = data.map((json) => Category.fromJson(json)).toList();
      setState(() {
        categories = fetchedCategories;
        tabController = TabController(length: categories.length, vsync: this);
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }
}