import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  final SplashscreenController _splashscreenController =
      Get.put(SplashscreenController());

  @override
  void initState() {
    super.initState();
    _splashscreenController.cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Loading',
        ),
      ),
    );
  }
}
