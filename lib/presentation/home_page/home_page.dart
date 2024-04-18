import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/list_item_widget.dart';
import 'widgets/userprofile1_item_widget.dart';
import 'widgets/userprofile_item_widget.dart'; 


// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 46.v),
              SizedBox(
                height: 553.v,
                width: 412.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgAvatar,
                      height: 84.adaptSize,
                      width: 84.adaptSize,
                      radius: BorderRadius.circular(
                        42.h,
                      ),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 29.h),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Good Morning ",
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "John Aiseel",
                              style: CustomTextStyles.titleLarge22,
                            ),
                          ),
                          SizedBox(height: 31.v),
                          Padding(
                            padding: EdgeInsets.only(right: 16.h),
                            child: CustomSearchView(
                              controller: searchController,
                              hintText:
                                  "Search Company, Job Profile, .......People",
                            ),
                          ),
                          SizedBox(height: 40.v),
                          _buildList(context),
                          SizedBox(height: 35.v),
                          _buildRowservice(context),
                          SizedBox(height: 35.v),
                          _buildUserprofile(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.v),
              _buildUserprofile1(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return SizedBox(
      height: 44.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRowservice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Service",
            style: CustomTextStyles.titleLarge22,
          ),
          Text(
            "View all",
            style: CustomTextStyles.titleLargeGray800,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserprofile(BuildContext context) {
    return SizedBox(
      height: 202.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return UserprofileItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserprofile1(BuildContext context) {
    return SizedBox(
      height: 202.v,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return Userprofile1ItemWidget();
        },
      ),
    );
  }
}
