import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mutasi_controller.dart';

class MutasiView extends GetView<MutasiController> {
  const MutasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MutasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MutasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
