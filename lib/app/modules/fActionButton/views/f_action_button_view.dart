import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/scan/views/scan_view.dart';

import '../controllers/f_action_button_controller.dart';

class FActionButtonView extends GetView<FActionButtonController> {
  const FActionButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.qr_code_scanner_outlined),
            title: Text('Scan Qr Code'),
            onTap: () {
              Get.to(ScanView());
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_outlined),
            title: Text('Qr Code'),
            onTap: () {
              Get.to(ScanView());
            },
          ),
        ],
      ),
    );
  }
}
