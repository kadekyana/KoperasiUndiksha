import 'package:get/get.dart';

import '../controllers/f_action_button_controller.dart';

class FActionButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FActionButtonController>(
      () => FActionButtonController(),
    );
  }
}
