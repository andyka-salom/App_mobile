import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get notoSans {
    return copyWith(
      fontFamily: 'Noto Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}


class CustomTextStyles {
  // Body text style
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
      
        static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
        static get titleMediumIndigoA200_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.indigoA200,
      );
  static get bodyLargeGray50001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeNotoSansGray600 =>
      theme.textTheme.bodyLarge!.notoSans.copyWith(
        color: appTheme.gray600,
      );
  static get displayMediumBold => theme.textTheme.displayMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
      );
  static get titleLargeGray50001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray800,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumBluegray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray600,
      );
  static get titleMediumGray50001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 18.fSize,
      );
        static get titleMediumRobotoBlack900 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
        static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleMediumGray50001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
        static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumOnPrimary18 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
      );
  static get titleSmallGray50001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50001,
      );
  static get titleSmall_1 => theme.textTheme.titleSmall!;
    static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMedium14_1 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray800,
        fontSize: 14.fSize,
      );
  static get bodyMediumIndigoA200 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigoA200,
        fontSize: 14.fSize,
      );
// Headline text style
  static get headlineSmallBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
// Title text style
  static get titleLargeIndigoA200 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigoA200,
        fontSize: 20.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlack90016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
      );
  static get titleMediumBlack900Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  // static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
  //       color: appTheme.blueGray900,
  //     );

  // static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
  //       color: appTheme.whiteA700,
  //     );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
}
