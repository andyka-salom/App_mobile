import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: must_be_immutable

class ChipviewItemWidget extends StatelessWidget {
  const ChipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Graphic Designing",
        style: TextStyle(
          color: appTheme.blueGray600,
          fontSize: 14.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blue50,
      selectedColor: appTheme.blue50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.blue100,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          18.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
