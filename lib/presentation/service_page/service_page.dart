import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/jobdetailslist_item_widget.dart'; // ignore_for_file: must_be_immutable

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key})
      : super(
          key: key,
        );

  @override
  ServicePageState createState() => ServicePageState();
}

class ServicePageState extends State<ServicePage>
    with AutomaticKeepAliveClientMixin<ServicePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 26.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 32.h,
                    right: 29.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildJobDetailsList(context),
                      SizedBox(height: 7.v),
                      _buildJobDetailsStack(context),
                      SizedBox(height: 10.v),
                      Container(
                        width: 217.h,
                        padding: EdgeInsets.symmetric(vertical: -42.v),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "20k - 30k / month",
                          style: CustomTextStyles.titleMediumIndigoA200,
                        ),
                      )
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
  Widget _buildJobDetailsList(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.5.v),
          child: SizedBox(
            width: 332.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.gray600,
            ),
          ),
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return JobdetailslistItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildJobDetailsStack(BuildContext context) {
    return SizedBox(
      height: 131.v,
      width: 364.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 6.v,
              ),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFigmaPng0,
                        height: 54.adaptSize,
                        width: 54.adaptSize,
                        radius: BorderRadius.circular(
                          15.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.h,
                          top: 2.v,
                          bottom: 3.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "UI / UX Designer",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 10.v),
                            Text(
                              "Figma",
                              style: theme.textTheme.bodyLarge,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 11.v),
                  Divider(),
                  SizedBox(height: 21.v),
                  Padding(
                    padding: EdgeInsets.only(left: 55.h),
                    child: Text(
                      "New york, United States",
                      style: theme.textTheme.titleMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgMapPinIc,
            height: 32.adaptSize,
            width: 32.adaptSize,
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 27.h),
          )
        ],
      ),
    );
  }
}
