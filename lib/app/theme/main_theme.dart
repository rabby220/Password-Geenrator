import 'package:flutter/material.dart';
import 'package:random_password/app/utils/app_colors.dart';
import 'custom_theme/appbar_theme.dart';


class AppTheme {
  //Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    brightness: Brightness.light,
    appBarTheme: CustomAppBarTheme.lightAppbarTheme,

  );

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: CustomAppBarTheme.darkAppbarTheme,
  );
}
