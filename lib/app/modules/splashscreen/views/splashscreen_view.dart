import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: Colors.indigo[900],
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('images/splash.json'),
            FittedBox(
              child: Text(
                '--------------------------------',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                  child: Text(
                'Koperasi Undiksha',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
