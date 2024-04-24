import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart'; // ignore: must_be_immutable

class JobdetailslistItemWidget extends StatelessWidget {
  const JobdetailslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.v),
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
          ),
          SizedBox(height: 26.v),
          SizedBox(
            height: 80.v,
            width: 331.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                CustomElevatedButton(
                  width: 92.h,
                  text: "Order",
                  alignment: Alignment.bottomRight,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 86.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 27.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                    style: theme.textTheme.titleMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Container(
                          width: 217.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 10.v,
                          ),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderLR20,
                          ),
                          child: Text(
                            "20k - 30k / month",
                            style: CustomTextStyles.titleMediumIndigoA200,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
