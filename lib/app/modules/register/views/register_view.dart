import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController controller = Get.put(RegisterController());
  final _formkey = GlobalKey<FormState>();
  final RxBool sembunyikan = false.obs;

  void buttonSembunyikan() {
    sembunyikan.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final fullMQ = MediaQuery.of(context).size.height;
    final fullMQe = MediaQuery.of(context).size.width;
    final MyAP = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo[900],
      title: Text('Koperasi Undiksha'),
      centerTitle: true,
    );
    final PaddingTop = MediaQuery.of(context).padding.top;

    final BodyMQH = fullMQ - MyAP.preferredSize.height - PaddingTop;
    final BodyMQW = fullMQe - MyAP.preferredSize.height - PaddingTop;

    final bool orientasi =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: MyAP,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey,
        child: Center(
            child: Text(
          'copyright@2022 by Undiksha',
          style: TextStyle(fontSize: 14),
        )),
      ),
      body: SingleChildScrollView(
        child: (orientasi)
            ? Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: BodyMQH * 0.1,
                    ),
                    Center(
                      child: Container(
                        width: BodyMQW * 0.5,
                        height: BodyMQH * 0.5,
                        child: Image(
                          image: AssetImage('images/Logo_undiksha.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: BodyMQH * 0.1,
                    ),
                    Container(
                      width: BodyMQW * 0.9,
                      height: BodyMQH * 1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue,
                      ),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: BodyMQH * 0.05,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Email',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan Username/Email'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.person)),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Password',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.password,
                                  obscureText: !sembunyikan.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password Tidak Boleh Kosong";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      label: Text('Masukkan Password'),
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                          onPressed: buttonSembunyikan,
                                          icon: sembunyikan.value
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Nama',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Nama Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan Nama'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.verified_user)),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 10, left: 20),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10),
                            //     child: Text(
                            //       'NIM',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.nim,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "NIM Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan NIM'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.numbers_outlined)),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Center(
                                  child: FilledButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        _formkey.currentState!.save();
                                        return controller.register(
                                            controller.email.text,
                                            controller.password.text,
                                            controller.name.text,
                                            controller.nim.text);
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.indigo[900]),
                                        elevation: MaterialStatePropertyAll(10),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 5))),
                                    child: Text('Register'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginView(),
                                            ),
                                          );
                                        },
                                        child: FittedBox(
                                          child: Text(
                                            'Sudah Punya Akun ? Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: BodyMQH * 0.05,
                    ),
                  ],
                ),
              )
            : Form(
                key: _formkey,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: BodyMQW * 0.4,
                        height: BodyMQH * 0.25,
                        child: Image(
                          image: AssetImage('images/Logo_undiksha.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: BodyMQH * 0.01,
                    ),
                    Container(
                      width: BodyMQW * 1.2,
                      height: BodyMQH * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue,
                      ),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: BodyMQH * 0.05,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Email',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan Username/Email'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.person)),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Password',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.password,
                                  obscureText: !sembunyikan.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password Tidak Boleh Kosong";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      label: Text('Masukkan Password'),
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                          onPressed: buttonSembunyikan,
                                          icon: sembunyikan.value
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 10),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10, left: 10),
                            //     child: Text(
                            //       'Nama',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Nama Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan Nama'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.verified_user)),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 10, left: 20),
                            //   child: Container(
                            //     width: 100,
                            //     height: 30,
                            //     padding: EdgeInsets.only(top: 10),
                            //     child: Text(
                            //       'NIM',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: controller.nim,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "NIM Tidak Boleh Kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Text('Masukkan NIM'),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.numbers_outlined)),
                              ),
                            ),
                            SizedBox(
                              height: BodyMQH * 0.03,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Center(
                                  child: FilledButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        _formkey.currentState!.save();
                                        return controller.register(
                                            controller.email.text,
                                            controller.password.text,
                                            controller.name.text,
                                            controller.nim.text);
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.indigo[900]),
                                        elevation: MaterialStatePropertyAll(10),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 5))),
                                    child: Text('Register'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginView(),
                                            ),
                                          );
                                        },
                                        child: FittedBox(
                                          child: Text(
                                            'Sudah Punya Akun ? Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: BodyMQH * 0.05,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
