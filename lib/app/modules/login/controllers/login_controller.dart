import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pemmob_lanjut/app/model/usermodel.dart';
import 'package:pemmob_lanjut/app/modules/home/views/home_view.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:pemmob_lanjut/layouting/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
  final dio = Dio();
  final String baseUrl = "http://apikoperasi.rey1024.com";
  List data = [];
  void getData() async {
    final response = await dio.get(baseUrl + '/users');
    print(response);
  }

  void login(String username, String password) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {'username': username, 'password': password},
        options: Options(
          headers: {'Access-Control-Request-Method': 'POST'},
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('Email', response.data[0]['username']);
        prefs.setString('Nama', response.data[0]['nama']);
        prefs.setString('Saldo', response.data[0]['saldo']);
        prefs.setString('No_Rekening', response.data[0]['nomor_rekening']);
        prefs.setBool('Login', true);
        data = [
          {
            'nama': prefs.getString('Nama'),
            'email': prefs.getString('Email'),
            'saldo': prefs.getString('Saldo'),
            'no_rek': prefs.getString('No_Rekening'),
            'Userlogin': prefs.getBool('Login')
          }
        ];
        print(data[0]['nama']);
        Get.to(HomeView());
        Get.snackbar("Success Login", "Selamat Mencoba",
            backgroundColor: Colors.indigo[900],
            borderColor: Colors.black,
            borderWidth: 1,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Username atau Password Salah");
      }
    } catch (e) {
      Get.snackbar('Erorr', 'Email And Password Salah, Coba Lagi !',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          borderWidth: 1,
          borderColor: Colors.black);
      print(e);
    }
  }

  void logout() async {
    username.clear();
    password.clear();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.to(LoginView());
  }

  final count = 0.obs;
  @override
  void onInit() {
    // getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    username.clear();
    password.clear();
    super.onClose();
  }

  void increment() => count.value++;
}

// Launcher Icon
// Splash Screen
// onboarding screen
// access native device file , camera , 
// qr scanner and qr generator
// lottie - lottiefiles
// story set
