import 'package:get/get.dart';

import '../controllers/detail_transfer_controller.dart';

class DetailTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransferController>(
      () => DetailTransferController(),
    );
  }
}
