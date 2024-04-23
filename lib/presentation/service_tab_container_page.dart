import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_title.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_search_view.dart';
import 'service_page.dart'; // ignore_for_file: must_be_immutable

class ServiceTabContainerPage extends StatefulWidget {
  const ServiceTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  ServiceTabContainerPageState createState() => ServiceTabContainerPageState();
}

class ServiceTabContainerPageState extends State<ServiceTabContainerPage>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 25.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 17.h,
                    right: 15.h,
                  ),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search Company, Job Profile, .......People",
                  ),
                ),
                SizedBox(height: 40.v),
                _buildTabview(context),
                SizedBox(
                  height: 691.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      ServicePage(),
                      ServicePage(),
                      ServicePage(),
                      ServicePage()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 52.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 14.v,
          bottom: 13.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarTitle(
        text: "Service",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 44.v,
      width: 411.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.onPrimary,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.blueGray600,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.blueGray600,
          borderRadius: BorderRadius.circular(
            22.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "All",
            ),
          ),
          Tab(  
            child: Text(
              "Development",
            ),
          ),
          Tab(
            child: Text(
              "Designing",
            ),
          ),
          Tab(
            child: Text(
              "Marketing",
            ),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
