import 'package:get/get.dart';

import '../../history/controllers/history_controller.dart';
import '../../random_pass/controllers/random_pass_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<RandomPassController>(
      () => RandomPassController(),
    );

    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );

    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
