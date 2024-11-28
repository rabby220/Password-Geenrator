import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_password/app/modules/settings/controllers/settings_controller.dart';
import 'package:random_password_generator/random_password_generator.dart';

class RandomPassController extends GetxController {
  SettingsController settingsController = Get.put(SettingsController());
  final passwordController = TextEditingController();
  final titleController = TextEditingController();

  var newPassword = ''.obs;
  var passwordStrengthChecker = 0.0.obs; // Use this for strength indicator

  var sliderSelectedValue = 10.0.obs;

  var isUpperCase = false.obs;
  var isLowerCase = false.obs;
  var isSymbols = false.obs;
  var isNumbers = false.obs;
  // Add a new observable for password visibility
  var isPasswordVisible = false.obs;
  void updateUpperCaseCheckBox(bool value) {
    isUpperCase.value = value;
    settingsController.triggerVibration();
  }

  void updateLowerCaseCheckBox(bool value) {
    isLowerCase.value = value;
    settingsController.triggerVibration();
  }

  void updateSymbolsCheckBox(bool value) {
    isSymbols.value = value;
    settingsController.triggerVibration();
  }

  void updateNumberCheckBox(bool value) {
    isNumbers.value = value;
    settingsController.triggerVibration();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void updateSlider(double value) {
    sliderSelectedValue.value = value;
    settingsController.triggerVibration();
  }

  void passwordGeneratedFunc() {
    final password = RandomPasswordGenerator();

    // Generate a random password
    String generatedPassword = password.randomPassword(
        letters: isLowerCase.value,
        uppercase: isUpperCase.value,
        numbers: isNumbers.value,
        specialChar: isSymbols.value,
        passwordLength: sliderSelectedValue.value);

// Update the TextField with the new password
    passwordController.text = generatedPassword;
    newPassword.value = generatedPassword;

    // Check the strength of the password and update the strength variable
    double passWordStrength =
        password.checkPassword(password: generatedPassword);
    passwordStrengthChecker.value = passWordStrength;
    settingsController.triggerVibration(); // Update strength
  }
}
