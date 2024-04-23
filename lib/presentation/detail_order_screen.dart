import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_title.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_outlined_button.dart';
import 'widgets/chipview_item_widget.dart';
class ImageConstant {
  static const String imgNira = 'assets/images/img_nira.png';
  static const String imgTimerIc = 'assets/images/img_timer_ic.svg';
  static const String imgInfo = 'assets/images/img_info.svg';
  static const String imgEnvelopeIc = 'assets/images/img_envelope_ic.svg';
  static const String imgCallIc = 'assets/images/img_call_ic.svg';
  static const String imgArrowLeft = 'assets/images/img_arrow_left.svg';
  static const String imgMapPinIc = 'assets/images/img_map_pin_ic.svg';
}

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 23.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 9.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCompanyProfile(context),
                  SizedBox(height: 16.0),
                  CustomOutlinedButton(
                    text: "Description",
                    buttonTextStyle: CustomTextStyles.titleLargePrimary,
                    onPressed: () {
                      // Implementasi fungsi untuk menangani tombol
                    },
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    "Service Profile",
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 29.0),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 350.0,
                      margin: EdgeInsets.only(
                        left: 24.0,
                        right: 20.0,
                      ),
                      child: Text(
                        "Lorem Ipsum is simply dummy text...",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 33.0),
                  _buildChipView(context),
                  SizedBox(height: 86.0),
                  Text(
                    "Contact Details",
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 28.0),
                  _buildContactDetailRow(
                    imagePath: ImageConstant.imgEnvelopeIc,
                    text: "www.domain.com",
                  ),
                  SizedBox(height: 16.0),
                  _buildContactDetailRow(
                    imagePath: ImageConstant.imgInfo,
                    text: "Andrew.domain.com",
                  ),
                  SizedBox(height: 13.0),
                  _buildContactDetailRow(
                    imagePath: ImageConstant.imgCallIc,
                    text: "085 111 222 333",
                  ),
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
      leadingWidth: 44.0,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 16.0,
          top: 15.0,
          bottom: 12.0,
        ),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(
        text: "Detail Order",
        margin: EdgeInsets.only(left: 16.0),
      ),
    );
  }

  Widget _buildCompanyProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 31.0,
        vertical: 23.0,
      ),
      decoration: AppDecoration.outlineBluegray600.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNira,
            height: 56.0,
            width: 56.0,
            radius: BorderRadius.circular(
              15.0,
            ),
          ),
          SizedBox(height: 14.0),
          Text(
            "Graphic Designer",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 10.0),
          Text(
            "Poler Web-design",
            style: CustomTextStyles.bodyLargeGray50001
          ),
          SizedBox(height: 15.0),
          Divider(),
          SizedBox(height: 15.0),
          _buildDetailRow(
            imagePath: ImageConstant.imgMapPinIc,
            text: "California, United States",
          ),
          SizedBox(height: 14.0),
          Text(
            "15k - 25k / month",
            style: CustomTextStyles.titleMediumGray50001,
          ),
          SizedBox(height: 17.0),
          _buildDetailRow(
            imagePath: ImageConstant.imgTimerIc,
            text: "1 Month ago",
          ),
        ],
      ),
    );
  }

  Widget _buildChipView(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        runSpacing: 12.0,
        spacing: 12.0,
        children: List<Widget>.generate(6, (index) => ChipviewItemWidget()),
      ),
    );
  }

  Widget _buildContactDetailRow({required String imagePath, required String text}) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 32.0,
            width: 32.0,
          ),
          GestureDetector(
            onTap: () {
              onTapTextWebUrl();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                top: 5.0,
                bottom: 8.0,
              ),
              child: Text(
                text,
                style: CustomTextStyles.titleMediumGray50001Medium,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow({required String imagePath, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: 24.0,
          width: 24.0,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            top: 2.0,
            bottom: 5.0,
          ),
          child: Text(
            text,
            style: CustomTextStyles.titleMediumBluegray600,
          ),
        )
      ],
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTextWebUrl() {
    // Implementasi fungsi untuk menangani ketika URL ditekan
  }
}
