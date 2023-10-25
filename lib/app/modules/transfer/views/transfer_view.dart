import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_controller.dart';

// ignore: must_be_immutable
class TransferView extends GetView<TransferController> {
  TransferController controller = Get.put(TransferController());

  final String? qrResult;
  TransferView({Key? key, this.qrResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myAppbar = AppBar(
      title: const Text('Transfer'),
      centerTitle: true,
      backgroundColor: Colors.indigo[900],
    );
    final BMQH = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: BMQH * 1,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 100),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.user,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text('Cari Id User'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffA3A3A3),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                    Spacer(),
                    FilledButton(
                      onPressed: () {
                        if (controller.user.text.isNotEmpty) {
                          controller.cekUser(controller.user.text);
                          print(controller.user.text);
                        }
                      },
                      child: Text(
                        'Lanjutkan',
                        textAlign: TextAlign.center,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.indigo[900]),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
