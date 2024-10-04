import 'package:flutter/material.dart';
import 'package:random_password/app/utils/app_colors.dart';
import 'package:random_password/app/utils/app_text.dart';

class CustomAppBarTheme {
  //light Theme
  static AppBarTheme lightAppbarTheme = AppBarTheme(
    backgroundColor: AppColors.amberColor,

    centerTitle: true,
    toolbarHeight: 100.0,
    shadowColor: AppColors.indigoColor,
    foregroundColor: AppColors.blackColor,
    titleTextStyle: AppText.appBarTextStyle,
  );

  //Dark Theme
  static AppBarTheme darkAppbarTheme = AppBarTheme(
    backgroundColor: AppColors.blackColor,
    centerTitle: true,
    toolbarHeight: 100.0,
    elevation: 10.0,
    shadowColor: AppColors.orangeColor,
    foregroundColor: AppColors.indigoColor,
    titleTextStyle: AppText.appBarTextStyle,
  );
}
