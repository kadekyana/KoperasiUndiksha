import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  final String qrResult;
  TransferView({Key? key, required this.qrResult}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransferView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Hasil : ${qrResult}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
