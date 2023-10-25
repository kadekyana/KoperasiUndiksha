import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/login/controllers/login_controller.dart';
import 'package:pemmob_lanjut/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/page_qr_code_controller.dart';

class PageQrCodeView extends GetView<PageQrCodeController> {
  PageQrCodeView({Key? key}) : super(key: key);
  final LoginController loginSp = Get.find<LoginController>();
  final SplashscreenController Ss = Get.find<SplashscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.indigo[900],
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Color(0xffC2D9FF),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
          ),
          Positioned(
            top: 180,
            left: 85,
            child: Text(
              'Scan Your Qr Code',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 230,
            left: 80,
            child: QrImageView(
              data:
                  '${loginSp.data.isNotEmpty ? loginSp.data[0]['user_id'] : Ss.data[0]['user_id']}',
              version: QrVersions.auto,
              size: 200,
              gapless: false,
            ),
          ),
        ],
      ),
    );
  }
}
