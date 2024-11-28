import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password/app/utils/app_colors.dart';

class AppText {
  static const String passwordGeneratorText = "Generate";
  static const String historyText = "History";
  static const String settingsText = "Settings";

  static const String themeText = "Theme";
  static const String vibrationText = "Vibration";
  static const String aboutText = "About App";
  static const String versionText = "Version";

  static const String darkThemeText = "Dark Theme";
  static const String lightThemeText = "Light Theme";


  //Check box Data
  static const String uppercaseLetterText = "Uppercase letters";
  static const String lowercaseLetterText = "Lowercase letters";
  static const String symbolsText = "Symbols";
  static const String numbersText = "Numbers";

  //Three button Text
  static const String generatePasswordText = "Generate Password";
  static const String copyText = "Copy";
  static const String saveText = "Save";



  static TextStyle bottomDarkTextStyle = GoogleFonts.ubuntu(
    fontSize: 18.0,
    color: AppColors.indigoColor,
  );
  static TextStyle bottomLightTextStyle = GoogleFonts.ubuntu(
    fontSize: 18.0,
    color: AppColors.deepOrangeColor,
  );

  //Dark App Bar Text Style
  static TextStyle appBarTextStyle = GoogleFonts.josefinSans(
    fontSize: 30.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}
