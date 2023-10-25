import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/home/controllers/home_controller.dart';
import '../controllers/detail_transfer_controller.dart';

class DetailTransferView extends StatefulWidget {
  final dynamic data;
  DetailTransferView({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailTransferView> createState() => _DetailTransferViewState();
}

class _DetailTransferViewState extends State<DetailTransferView> {
  final HomeController homeSp = Get.find<HomeController>();
  final DetailTransferController controller =
      Get.put(DetailTransferController());

  FocusNode _amountFocusNode = FocusNode();
  final TextEditingController jumlah = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(_amountFocusNode);
  }

  @override
  void dispose() {
    _amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String datRek = widget.data[0]['nomor_rekening'] ?? '';
    String datUser = widget.data[0]['user_id'] ?? '';
    String datNama = widget.data[0]['nama'] ?? '';

    final TextEditingController nama = TextEditingController(text: datNama);
    final TextEditingController no_rek = TextEditingController(text: datRek);
    final TextEditingController id_user = TextEditingController(text: datUser);
    print(widget.data);

    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      //   child: FilledButton(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStatePropertyAll(
      //         Colors.indigo[900],
      //       ),
      //     ),
      //     onPressed: () {
      //       controller.transferUang(no_rek.text, jumlah.text, id_user.text);
      //     },
      //     child: Text(
      //       'Kirim',
      //       style: TextStyle(
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w700,
      //           fontSize: 15),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Form(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 125,
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 35,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 30,
                                              child: TextFormField(
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                controller: nama,
                                                readOnly: true,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 20,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.13,
                                                    height: 20,
                                                    child: TextFormField(
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      controller: no_rek,
                                                      readOnly: true,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffA3A3A3),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.13,
                                                    height: 20,
                                                    child: TextFormField(
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      controller: id_user,
                                                      readOnly: true,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffA3A3A3),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),
                              Expanded(
                                child: TextFormField(
                                  focusNode: _amountFocusNode,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final formattedValue = homeSp
                                        .formatStringToRupiahTransfer(value);
                                    if (formattedValue != jumlah.text) {
                                      jumlah.value = TextEditingValue(
                                        text: formattedValue,
                                        selection: TextSelection.fromPosition(
                                          TextPosition(
                                              offset: formattedValue.length),
                                        ),
                                      );
                                    }
                                  },
                                  onEditingComplete: () {
                                    if (jumlah.text.isNotEmpty) {
                                      controller.transferUang(no_rek.text,
                                          jumlah.text, id_user.text);
                                    } else {
                                      GetSnackBar(
                                        title: 'Error',
                                        messageText: Text(
                                            'Masukkan Jumlah Transfer dengan benar'),
                                      );
                                    }
                                  },
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                  controller: jumlah,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Rp. 0',
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
