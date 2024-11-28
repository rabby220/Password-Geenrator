import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';

class SettingsController extends GetxController {
  var isSwitch = false.obs;
  late Box userBox;

  var isVibration = false.obs;

  void updateVibrationSettings(bool newValue) {
    isVibration.value = newValue;
    userBox.put('isVibration', newValue);
  }

  void triggerVibration() {
    if (isVibration.value) {

      Vibration.vibrate(duration: 100);
    }
  }

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      userBox = Hive.box('userBox');
      isSwitch.value = userBox.get('isSwitch', defaultValue: isSwitch.value);
      isVibration.value =
          userBox.get('isVibration', defaultValue: isVibration.value);

      if (isSwitch.value) {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
      }
    });
  }

  void updateThemeSettings(bool newValue) {
    isSwitch.value = newValue;

    if (newValue) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    userBox.put('isSwitch', newValue);
  }
}
