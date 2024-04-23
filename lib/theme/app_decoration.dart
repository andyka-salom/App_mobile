import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
        static BoxDecoration get fillBlue50 => BoxDecoration(
        color: appTheme.blue50,
      );
        static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue5001,
      );
      static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: appTheme.blueGray50,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          )
        ],
      );
// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        color: appTheme.blue50,
        border: Border.all(
          color: appTheme.blue100,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );
        static BoxDecoration get outlineGray200 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 3.h,
          ),
        ),
      );
      static BoxDecoration get gradientRedToGreenA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.red100, appTheme.blueA100, appTheme.greenA200],
        ),
      );
        static BoxDecoration get outlineOnPrimary => BoxDecoration(
        color: appTheme.blue5001,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              11,
            ),
          )
        ],
      );
      static BoxDecoration get outlineIndigoAF => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA2000f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              6,
            ),
          )
        ],
      );
        static BoxDecoration get outlineGray30077 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray30077,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
        static BoxDecoration get outlineBluegray600 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: appTheme.blueGray600,
          width: 1.h,
        ),
      );
      
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder21 => BorderRadius.circular(
        21.h,
      );
  static BorderRadius get circleBorder42 => BorderRadius.circular(
        42.h,
      );
        static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
// Custom borders
  static BorderRadius get customBorderLR20 => BorderRadius.horizontal(
        right: Radius.circular(20.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
        static BorderRadius get circleBorder37 => BorderRadius.circular(
        37.h,
      );
  static BorderRadius get circleBorder59 => BorderRadius.circular(
        59.h,
      );
  static BorderRadius get circleBorder66 => BorderRadius.circular(
        66.h,
      );
  static BorderRadius get circleBorder72 => BorderRadius.circular(
        72.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
}
