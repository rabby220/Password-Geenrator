import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_password/app/utils/app_colors.dart';
import 'package:random_password/app/utils/app_text.dart';
import '../controllers/random_pass_controller.dart';
import 'package:password_strength_indicator/password_strength_indicator.dart';

class RandomPassView extends GetView<RandomPassController> {
  const RandomPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Pass'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              //Upper Case Letter
              _buildListWidget(
                AppText.uppercaseLetterText,
                Obx(
                  () => _buildCheckBox(
                    controller.isUpperCase.value,
                    (value) => controller.updateUpperCaseCheckBox(value!),
                  ),
                ),
              ),
              //Lower Case
              _buildListWidget(
                AppText.lowercaseLetterText,
                Obx(
                  () => _buildCheckBox(
                    controller.isLowerCase.value,
                    (value) => controller.updateLowerCaseCheckBox(value!),
                  ),
                ),
              ),
              //Symbol
              _buildListWidget(
                AppText.symbolsText,
                Obx(
                  () => _buildCheckBox(
                    controller.isSymbols.value,
                    (value) => controller.updateSymbolsCheckBox(value!),
                  ),
                ),
              ),

              //Number
              _buildListWidget(
                AppText.numbersText,
                Obx(
                  () => _buildCheckBox(
                    controller.isNumbers.value,
                    (value) => controller.updateNumberCheckBox(value!),
                  ),
                ),
              ),

              Obx(
                () => _buildTextFormField(
                  enableInteraction: false,
                  textEditingController : controller.passwordController,
                  maxLine: 1,
                  readOnly: true,
                  // Toggle between hidden and shown
                  obscureText:!controller.isPasswordVisible.value,

                  inputDecoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: () {
                        // Toggle the password visibility when the icon is pressed
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                          // Choose the icon based on whether the password is visible
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              /// Password Strength
              Text('Password Strength'),
              const SizedBox(
                height: 10.0,
              ),
              Obx(
                () => PasswordStrengthIndicator(
                  width: double.infinity,
                  thickness: 12,
                  backgroundColor: AppColors.greyColor,
                  radius: 8,
                  colors: StrengthColors(
                    weak: AppColors.redAccentColor,
                    medium: AppColors.orangeColor,
                    strong: AppColors.greenColor,
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  password: controller.newPassword.value,
                  style: StrengthBarStyle.dashed,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),

              /// Slider
              Text('Password Length'),
              Obx(
                () => Slider(
                  value: controller.sliderSelectedValue.value,
                  max: 50.0,
                  min: 8.0,
                  divisions: 50,
                  thumbColor: AppColors.greenColor,
                  activeColor: AppColors.redColor,
                  inactiveColor: AppColors.greyColor,
                  label:
                      controller.sliderSelectedValue.value.toInt().toString(),
                  onChanged: (double newValue) {
                    controller.updateSlider(newValue);
                  },
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              _buildButton(() {
// Check if at least one checkbox is selected
                if (!controller.isUpperCase.value &&
                    !controller.isLowerCase.value &&
                    !controller.isSymbols.value &&
                    !controller.isNumbers.value) {
                  // Show a message to the user if no checkbox is selected
                  Get.snackbar(
                    'Selection Required',
                    'Please select at least one option.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                } else {
                  // If at least one checkbox is selected, generate the password
                  controller.passwordGeneratedFunc();
                }
              }, AppText.generatePasswordText, AppColors.blueColor),
              const SizedBox(
                height: 10.0,
              ),
              _buildButton(() {
                Clipboard.setData(
                        ClipboardData(text: controller.passwordController.text))
                    .then((value) {
                  return Get.snackbar(
                      'Password Copied', 'Password copied to clipboard.',
                      snackPosition: SnackPosition.TOP);
                });
              }, AppText.copyText, AppColors.amberColor),
              const SizedBox(
                height: 10.0,
              ),
              _buildButton(() {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Save Password'),
                      content: Wrap(
                        children: [
                          //fuck me
                          _buildTextFormField(

                            textEditingController : controller.titleController,
                            inputDecoration: InputDecoration(
                              labelText: 'Title',
                              hintText: 'Enter Title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                            width: 15.0,
                          ),
                          Obx(
                            () => _buildTextFormField(
                              enableInteraction: false,
                              textEditingController: controller.passwordController,
                              maxLine: 1,
                              readOnly:  true,
                              obscureText: !controller.isPasswordVisible.value,
                              inputDecoration: InputDecoration(
                                suffix: IconButton(
                                  onPressed: () {
                                    // Toggle the password visibility when the icon is pressed
                                    controller.togglePasswordVisibility();
                                  },
                                  icon: Icon(
                                      // Choose the icon based on whether the password is visible
                                      controller.isPasswordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        _buildActionButton(
                          onPressed: () {},
                          text: 'Save',
                          color: AppColors.greenColor,
                        ),
                        _buildActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          color: AppColors.redColor,
                        ),
                      ],
                    );
                  },
                );
              }, AppText.saveText, AppColors.greenColor),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(VoidCallback onPressed, String text, Color color) {
  return MaterialButton(
    onPressed: onPressed,
    color: color,
    padding: EdgeInsets.all(20.0),
    child: Text(text),
  );
}

//list Tile Widget for check Box Value
Widget _buildListWidget(String title, Widget trailWidget) {
  return ListTile(
    title: Text(title),
    trailing: trailWidget,
  );
}

//CheckBox Widget for check value or not
Widget _buildCheckBox(bool value, ValueChanged<bool?> onChanged) {
  return Checkbox(value: value, onChanged: onChanged);
}

//Alert action Button Save or Cancel Button
Widget _buildActionButton({
  required VoidCallback onPressed,
  required String text,
  required Color color,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: color,
    child: Text(text),
  );
}

//288
Widget _buildTextFormField({
  bool? enableInteraction,
  required TextEditingController textEditingController,
  int? maxLine,
   bool readOnly = false,      // Default value set to false
   bool obscureText = false,   // Default value set to false
  required InputDecoration inputDecoration,
}) {
  return TextFormField(
    enableInteractiveSelection: enableInteraction,
    controller: textEditingController,
    maxLines: maxLine,
    readOnly: readOnly,
    obscureText: obscureText,
    decoration: inputDecoration,
  );
}
