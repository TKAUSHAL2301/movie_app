import 'package:flutter/material.dart';

import 'app_palete.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: AppPalette.tertiaryColor)),
      primaryColor: AppPalette.primaryColor,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppPalette.primaryColor,
        secondary: AppPalette.secondaryColor,
        tertiary: AppPalette.tertiaryColor,
        surface: Colors.black,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.white,
      ));
}
