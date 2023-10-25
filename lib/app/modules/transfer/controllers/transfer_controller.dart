import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:dio/dio.dart';
import 'package:pemmob_lanjut/app/modules/DetailTransfer/views/detail_transfer_view.dart';

class TransferController extends GetxController {
  //TODO: Implement TransferController
  final TextEditingController user = TextEditingController();

  final dio = Dio();
  final String baseUrl = 'http://apikoperasi.rey1024.com/getsingleuser';
  List data = [];

  void cekUser(String IdUser) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {'user_id': IdUser},
        options: Options(
          headers: {'Access-Control-Request-Method': 'POST'},
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        Get.to(DetailTransferView(data: response.data));
      } else {
        Get.snackbar("Error", "User ID Tidak Ditemukan !");
      }
    } catch (e) {
      Get.snackbar('Erorr', 'User ID Tidak Ditemukan !',
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
