import 'package:get/get.dart';

import '../controllers/sukses_controller.dart';

class SuksesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuksesController>(
      () => SuksesController(),
    );
  }
}
