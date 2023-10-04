import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/home/views/home_view.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:pemmob_lanjut/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  List data = [];

  Future<List> cekLogin() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool Login = preferences.getBool('Login') ?? false;

    if (Login) {
      String? Nama = preferences.getString('Nama');
      String? Saldo = preferences.getString('Saldo');
      String? Email = preferences.getString('Email');
      String? No_rekening = preferences.getString('No_Rekening');
      data = [
        {'nama': Nama, 'saldo': Saldo, 'email': Email, 'no_rek': No_rekening}
      ];
    }
    Get.to(Login ? HomeView() : LoginView());
    return data;
  }
}
