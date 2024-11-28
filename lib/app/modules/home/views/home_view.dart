import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_password/app/modules/settings/controllers/settings_controller.dart';
import 'package:random_password/app/utils/app_colors.dart';
import 'package:random_password/app/utils/app_icons.dart';
import 'package:random_password/app/utils/app_text.dart';
import '../../history/views/history_view.dart';
import '../../random_pass/views/random_pass_view.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/home_controller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

SettingsController settingsController = Get.put(SettingsController());

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectIndex.value,
          children: const [
            RandomPassView(),
            HistoryView(),
            SettingsView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => _buildBottomNavigationBar(
          context,
          controller,
          settingsController,
        ),
      ),
    );
  }
}

// build a Bottom Navigation bar Widget
Widget _buildBottomNavigationBar(
  BuildContext context,
  HomeController controller,
  SettingsController settingsController,
) {
  return FlashyTabBar(
    animationCurve: Curves.easeOutQuart,
    animationDuration: const Duration(seconds: 1),
    height: 55,
    backgroundColor: settingsController.isSwitch.value
        ? AppColors.blackColor
        : AppColors.whiteColor,
    iconSize: 32,
    shadows: const [
      BoxShadow(
          color: Colors.indigo,
          blurRadius: 15.0,
          blurStyle: BlurStyle.outer,
          offset: Offset(-1, -1),
          spreadRadius: 1.0),
    ],
    items: [
      _flashyTabBarItem(
        icon: AppIcons.generatePasswordIcon,
        title: AppText.passwordGeneratorText,
        settingsController: settingsController,
      ),
      _flashyTabBarItem(
        icon: AppIcons.historyIcon,
        title: AppText.historyText,
        settingsController: settingsController,
      ),
      _flashyTabBarItem(
        icon: AppIcons.settingsIcon,
        title: AppText.settingsText,
        settingsController: settingsController,
      ),
    ],
    selectedIndex: controller.selectIndex.value,
    onItemSelected: (index) {
      controller.selectIndex.value = index;
    },
  );
}

//FlashyTabBarItem List
FlashyTabBarItem _flashyTabBarItem({
  required Icon icon,
  required String title,
  required SettingsController settingsController,
}) {
  return FlashyTabBarItem(
    icon: icon,
    activeColor: settingsController.isSwitch.value
        ? AppColors.redColor
        : AppColors.redColor,
    inactiveColor: settingsController.isSwitch.value
        ? AppColors.whiteColor
        : AppColors.blackColor,
    title: Text(
      title,
      style: settingsController.isSwitch.value
          ? AppText.bottomDarkTextStyle
          : AppText.bottomLightTextStyle,
    ),
  );
}
