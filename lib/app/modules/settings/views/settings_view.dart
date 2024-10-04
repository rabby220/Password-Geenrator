import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_password/app/utils/app_colors.dart';
import 'package:random_password/app/utils/app_icons.dart';
import '../../../utils/app_text.dart';
import '../controllers/settings_controller.dart';
import 'package:vibration/vibration.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: //ValueListenableBuilder(
          // valueListenable: Hive.box('userBox').listenable(),
          // builder: (context, userBox, child) =>
          _buildListWidget(context, controller),
      // ),
    );
  }
}

//
Widget _buildListWidget(BuildContext context, SettingsController controller) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Obx(
              () => _buildListTileWidget(
                title: AppText.themeText,
                subtitle: controller.isSwitch.value
                    ? AppText.darkThemeText
                    : AppText.lightThemeText,
                trailWidget: Obx(
                  () => _buildSwitch(
                    controller.isSwitch.value,
                    (newValue) {
                      controller.updateThemeSettings(newValue);
                    },
                  ),
                ),
                controller: controller,
                icon: AppIcons.darkModeRoundedIcon,
              ),
            ),
            Obx(
              () => _buildListTileWidget(
                title: AppText.vibrationText,
                subtitle: '',
                trailWidget: Obx(
                  () => _buildSwitch(
                    controller.isVibration.value,
                    (newValue) {
                      controller.updateVibrationSettings(newValue);
                    },
                  ),
                ),
                controller: controller,
                icon: AppIcons.vibrationRoundedIcon,
              ),
            ),
            Obx(
              () => _buildListTileWidget(
                title: AppText.aboutText,
                subtitle: '',
                controller: controller,
                icon: AppIcons.infoOutlineRoundedIcon,
              ),
            ),
            Obx(
              () => _buildListTileWidget(
                title: AppText.versionText,
                subtitle: '',
                controller: controller,
                icon: AppIcons.codeIcon,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//
Widget _buildListTileWidget(
    {required String title,
    required String subtitle,
    Widget? trailWidget,
    required SettingsController controller,
    required Icon icon}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: trailWidget ?? const SizedBox.shrink(),
    leading: CircleAvatar(
      backgroundColor: controller.isSwitch.value
          ? AppColors.whiteColor
          : AppColors.amberColor,
      foregroundColor: controller.isSwitch.value
          ? AppColors.blackColor
          : AppColors.whiteColor,
      maxRadius: 20.0,
      child: icon,
    ),
  );
}

Widget _buildSwitch(bool isSwitch, ValueChanged<bool> onChanged) {
  return Switch(
    value: isSwitch,
    onChanged: onChanged,
    activeColor: AppColors.indigoColor,
  );
}
