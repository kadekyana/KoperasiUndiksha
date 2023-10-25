import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pemmob_lanjut/app/modules/home/views/home_view.dart';

import '../controllers/sukses_controller.dart';

class SuksesView extends GetView<SuksesController> {
  const SuksesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                  child: FittedBox(
                child: Text(
                  'Sukses Transfer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              LottieBuilder.asset(
                'images/sukses.json',
                repeat: false,
              ),
              Spacer(),
              FilledButton(
                onPressed: () {
                  Get.to(HomeView());
                },
                child: Text('Kembali Ke Home'),
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
