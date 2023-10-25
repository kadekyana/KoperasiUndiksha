import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pemmob_lanjut/app/modules/Sukses/views/sukses_view.dart';

class DetailTransferController extends GetxController {
  //TODO: Implement DetailTransferController

  final dio = Dio();
  final String baseUrl = 'http://apikoperasi.rey1024.com/transfer';

  void transferUang(String no_rek, String jumlah, String id) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {
          'nomor_rekening': no_rek,
          'jumlah_transfer': jumlah,
          'id_pengirim': id
        },
        options: Options(
          headers: {'Access-Control-Request-Method': 'POST'},
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        Get.to(SuksesView());
      } else {
        Get.snackbar("Error", "Terjadi Kesalahan");
      }
    } catch (e) {
      Get.snackbar('Erorr', '${e}',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          borderWidth: 1,
          borderColor: Colors.black);
      print(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
