import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class Userprofile1ItemWidget extends StatelessWidget {
  const Userprofile1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21.v),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      width: 364.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Row(
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
                    bottom: 2.v,
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
          ),
          SizedBox(height: 11.v),
          Align(
            alignment: Alignment.center,
            child: Divider(
              indent: 16.h,
              endIndent: 16.h,
            ),
          ),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(left: 27.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMapPinIc,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 7.v,
                    bottom: 8.v,
                  ),
                  child: Text(
                    "New york, United States",
                    style: CustomTextStyles.titleMediumBluegray600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            width: 217.h,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillGray5001.copyWith(
              borderRadius: BorderRadiusStyle.customBorderLR20,
            ),
            child: Text(
              "20k - 30k / month",
              style: theme.textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
