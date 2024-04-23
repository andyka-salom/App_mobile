
import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "primary";
PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();



class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: appTheme.blue30087,
          elevation: 3,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray600,
      ),
      
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.blueGray600,
          fontSize: 18.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 40.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.indigoA200,
          fontSize: 16.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 15.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0XFF0977FF),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF453DE3),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
// Blue
  Color get blue100 => Color(0XFFB2D5FF);
  Color get blue200 => Color(0XFF8CBAEF);
  Color get blue30087 => Color(0X876BA6FF);
  Color get blue400 => Color(0XFF4D9CFF);
  Color get blue50 => Color(0XFFECF3FB);
  Color get blueA700 => Color(0XFF246BFD);
// BlueGray
  Color get blueGray100 => Color(0XFFCCDDE2);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray600 => Color(0XFF596574);
// Gray
  Color get gray100 => Color(0XFFF7F7F8);
  Color get gray200 => Color(0XFFEAEAEA);
  Color get gray50 => Color(0XFFFBFCFC);
  Color get gray500 => Color(0XFF9A9A9A);
  Color get gray50001 => Color(0XFF979AA0);
  Color get gray5001 => Color(0XFFF1F8FF);
  Color get gray600 => Color(0XFF828282);
  Color get gray800 => Color(0XFF4F4F4F);
  Color get indigoA200 => Color(0XFF736CFB);
  Color get blue300 => Color(0XFF66AAFF);
  Color get blue40001 => Color(0XFF509EE5);
  Color get blue5001 => Color(0XFFECF3FB);
  Color get blueA100 => Color(0XFF7BAFFF);
  Color get blueGray50 => Color(0XFFEFEFF1);
  Color get blueGray5001 => Color(0XFFEAEBF0);
  Color get blueGray900 => Color(0XFF323539);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30077 => Color(0X77E6E6E6);
  Color get gray80014 => Color(0X143D3D3D);
  Color get greenA200 => Color(0XFF7CFFB8);
  Color get indigoA2000f => Color(0X0F6875E6);
  Color get red100 => Color(0XFFFFD5D5);
  Color get whiteA700 => Color(0XFFFFFFFF);
}
