import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_password/app/theme/main_theme.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Open the userBox to load the saved theme state
  await Hive.openBox('userBox');

  var userBox = Hive.box('userBox');
  // Load the saved isSwitch value to determine the initial theme
  bool isSwitch = userBox.get('isSwitch', defaultValue: false);

  ThemeMode initialThemeMode = isSwitch ? ThemeMode.dark : ThemeMode.light;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Define initial binding to set up controllers
      initialBinding: HomeBinding(),
      // Define the initial route
      initialRoute: AppPages.INITIAL,
      // Define  routes
      getPages: AppPages.routes,
      // Theme setup
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // Set the initial theme based on saved state
      themeMode: initialThemeMode,
    ),
  );
}
