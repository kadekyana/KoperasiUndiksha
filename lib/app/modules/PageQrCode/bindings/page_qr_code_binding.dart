import 'package:get/get.dart';

import '../controllers/page_qr_code_controller.dart';

class PageQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageQrCodeController>(
      () => PageQrCodeController(),
    );
  }
}
