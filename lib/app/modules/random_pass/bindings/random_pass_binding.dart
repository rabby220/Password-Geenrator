import 'package:get/get.dart';

import '../controllers/random_pass_controller.dart';

class RandomPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RandomPassController>(
      () => RandomPassController(),
    );
  }
}
