import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'widgets/jobdetailslist_item_widget.dart';
class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  ServicePageState createState() => ServicePageState();
}

class ServicePageState extends State<ServicePage>
    with AutomaticKeepAliveClientMixin<ServicePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Pastikan untuk memanggil super.build(context)
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: Container(
          width: double.infinity, // Ganti double.maxFinite dengan double.infinity
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 26.0), // Ganti 26.v dengan 26.0 jika v bukan konstanta
              _buildJobDetailsList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildJobDetailsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0, right: 38.0), // Gunakan 24.0 dan 38.0 untuk kejelasan
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.5), // Gunakan 6.5 jika v bukan konstanta
            child: SizedBox(
              width: 332.0, // Ganti 332.h dengan 332.0 jika h bukan konstanta
              child: Divider(
                height: 1.0, // Ganti 1.v dengan 1.0 jika v bukan konstanta
                thickness: 1.0, // Ganti 1.v dengan 1.0 jika v bukan konstanta
                color: appTheme.gray600,
              ),
            ),
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return JobdetailslistItemWidget(); // Pastikan nama widget sesuai konvensi
        },
      ),
    );
  }
}
