import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/model/usermodel.dart';
import 'package:pemmob_lanjut/app/modules/fActionButton/views/f_action_button_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //Cara Lanang
  String? nama = '';
  String? saldo = '';
  String? email = '';
  String? no_rekening = '';
  List data = [];

  Future<List> getData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    nama = preferences.getString('Nama');
    saldo = preferences.getString('Saldo');
    email = preferences.getString('Email');
    no_rekening = preferences.getString('noRekening');
    data = [nama, saldo, email, no_rekening];
    return data;
  }

  void ModalQrCode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FActionButtonView();
      },
    );
  }
}
