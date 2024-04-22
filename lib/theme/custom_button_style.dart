import 'package:flutter/material.dart';
import '../core/app_export.dart';
/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
        static ButtonStyle get outlineBlue => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.h),
        ),
        shadowColor: appTheme.blue30087,
        elevation: 3,
      );
}
