import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //Cara Lanang
  String? nama = '';
  String? saldo = '';
  String? email = '';
  String? no_rekening = '';
  List data = [];

  String formatStringToRupiahTransfer(String saldoStr) {
    if (saldoStr.isEmpty) {
      return ''; // Kembalikan string kosong jika input kosong
    }

    try {
      final cleanedInput = saldoStr.replaceAll(RegExp(r'[^\d,]'), '');

      // Periksa apakah input hanya terdiri dari karakter koma
      final isOnlyCommas = cleanedInput.replaceAll(',', '').isEmpty;

      if (isOnlyCommas) {
        return ''; // Kasus khusus untuk input hanya berisi koma
      }

      final dotCount = cleanedInput.split('.').length - 1;
      if (dotCount > 1) {
        throw FormatException("Invalid input");
      }

      final formattedInput = cleanedInput.replaceAll(RegExp(r'^0+'), '');

      final saldo = int.parse(formattedInput.replaceAll(',', ''));
      final currencyFormat =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

      // Format teks ke dalam format Rupiah
      final formattedText = currencyFormat.format(saldo);

      // Hapus ,00 jika ada pada tiga digit terakhir
      if (formattedText.endsWith(',00')) {
        return formattedText.substring(0, formattedText.length - 3);
      } else {
        return formattedText;
      }
    } catch (e) {
      print('Kesalahan: $e');
      return 'Saldo tidak valid';
    }
  }

  String formatStringToRupiah(String saldoStr) {
    try {
      final saldo = int.parse(saldoStr);
      final currencyFormat =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
      return currencyFormat.format(saldo);
    } catch (e) {
      // Penanganan kesalahan jika konversi gagal
      print('Kesalahan: $e');
      return 'Saldo tidak valid';
    }
  }

  Future<List> getData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    nama = preferences.getString('Nama');
    saldo = preferences.getString('Saldo');
    email = preferences.getString('Email');
    no_rekening = preferences.getString('noRekening');
    data = [nama, saldo, email, no_rekening];
    return data;
  }
}
