import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/home/controllers/home_controller.dart';
import 'package:pemmob_lanjut/app/modules/home/views/home_view.dart';
import 'package:pemmob_lanjut/app/modules/login/controllers/login_controller.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:pemmob_lanjut/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:pemmob_lanjut/app/routes/app_pages.dart';
import 'package:pemmob_lanjut/layouting/hariPertama.dart';
import 'package:pemmob_lanjut/layouting/home.dart';
import 'package:pemmob_lanjut/layouting/tesDio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final login = Get.put(LoginController());
  final home = Get.put(HomeController());
  // String email = '';

  // Future<String?> getData() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final email = preferences.getString('Email');
  //   return email;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koperasi Undiksha',
      home: SplashscreenView(),
    );
  }
}
