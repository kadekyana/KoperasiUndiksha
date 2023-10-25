import 'dart:async';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/AfterSplash/views/after_splash_view.dart';
import 'package:pemmob_lanjut/app/modules/Onboarding/views/onboarding_view.dart';
import 'package:pemmob_lanjut/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  List data = [];

  Future<void> cekLogin() async {
    var duration = Duration(seconds: 3);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool Login = preferences.getBool('Login') ?? false;
    bool Onboarding = preferences.getBool('Getstart') ?? false;

    if (Login) {
      String? User_id = preferences.getString('User_id');
      String? Nama = preferences.getString('Nama');
      String? Saldo = preferences.getString('Saldo');
      String? Email = preferences.getString('Email');
      String? No_rekening = preferences.getString('No_Rekening');
      data = [
        {
          'user_id': User_id,
          'nama': Nama,
          'saldo': Saldo,
          'email': Email,
          'no_rek': No_rekening
        }
      ];
    }
    return Future.delayed(duration, () {
      if (Onboarding == false) {
        Get.to(OnboardingView());
      } else {
        Get.to(
          transition: Transition.fadeIn,
          duration: Duration(seconds: 3),
          Login ? BottomNavBarView() : AfterSplashView(),
        );
      }
    });
  }
}
