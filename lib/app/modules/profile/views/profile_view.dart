import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/CreditCard/views/credit_card_view.dart';
import 'package:pemmob_lanjut/app/modules/MyAppBar/views/my_app_bar_view.dart';
import 'package:pemmob_lanjut/app/modules/PageQrCode/views/page_qr_code_view.dart';
import 'package:pemmob_lanjut/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:pemmob_lanjut/app/modules/home/controllers/home_controller.dart';
import 'package:pemmob_lanjut/app/modules/login/controllers/login_controller.dart';
import 'package:pemmob_lanjut/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // ${loginSp.data.isNotEmpty ? loginSp.data[0]['email'] : Ss.data[0]['email']} , ${loginSp.data.isNotEmpty ? loginSp.data[0]['user_id'] : Ss.data[0]['user_id']}

  // QrImageView(
  //   data:
  //       '${loginSp.data.isNotEmpty ? loginSp.data[0]['user_id'] : Ss.data[0]['user_id']}',
  //   version: QrVersions.auto,
  //   size: 200,
  //   gapless: false,
  // ),

  final LoginController loginSp = Get.find<LoginController>();
  final SplashscreenController Ss = Get.find<SplashscreenController>();
  final HomeController homeSp = Get.find<HomeController>();
  List data = [];
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.indigo[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 120,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      foregroundImage: AssetImage('images/wi.png'),
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 170,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Color(0xffFFBB02),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card Koperasi',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                    Text(
                                      '${loginSp.data.isNotEmpty ? loginSp.data[0]['nama'] : Ss.data[0]['nama']}',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: Image.asset(
                                        'images/Logo_undiksha.png')),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  homeSp.formatStringToRupiah(
                                      loginSp.data.isNotEmpty
                                          ? loginSp.data[0]['saldo']
                                          : Ss.data[0]['saldo']),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Id',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                    Text(
                                      '${loginSp.data.isNotEmpty ? loginSp.data[0]['no_rek'] : Ss.data[0]['no_rek']} / ${loginSp.data.isNotEmpty ? loginSp.data[0]['user_id'] : Ss.data[0]['user_id']}',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 300,
                    child: CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            Get.to(PageQrCodeView());
                          },
                          icon: Icon(Icons.qr_code_2_rounded)),
                    ))
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: FilledButton(
                  onPressed: () {
                    loginSp.logout();
                  },
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo[900]),
                  ),
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
