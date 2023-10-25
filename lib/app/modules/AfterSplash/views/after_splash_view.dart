import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:pemmob_lanjut/app/modules/register/views/register_view.dart';

import '../controllers/after_splash_controller.dart';

class AfterSplashView extends GetView<AfterSplashController> {
  const AfterSplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 200,
              child: Image.asset('images/Logo_undiksha.png')),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            child: FittedBox(
              child: Text(
                'Koperasi Undiksha',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: FittedBox(
              child: Text(
                'Dharmaning Sajjana',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: FittedBox(
              child: Text(
                'Umerdhyaken Widyaguna',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          FilledButton(
            onPressed: () {
              Get.to(LoginView());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff0E21A0)),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
            ),
            child: Text(
              'Login',
              style:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          FilledButton(
            onPressed: () {
              Get.to(RegisterView());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff0E21A0)),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15, horizontal: 60),
              ),
            ),
            child: Text(
              'Registrasi',
              style:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
            ),
          ),
        ],
      )),
    );
  }
}
