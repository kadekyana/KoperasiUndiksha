import 'package:get/get.dart';

import '../controllers/my_app_bar_controller.dart';

class MyAppBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppBarController>(
      () => MyAppBarController(),
    );
  }
}
