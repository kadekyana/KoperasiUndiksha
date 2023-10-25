import 'package:get/get.dart';

import '../controllers/custom_oval_button_controller.dart';

class CustomOvalButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomOvalButtonController>(
      () => CustomOvalButtonController(),
    );
  }
}
