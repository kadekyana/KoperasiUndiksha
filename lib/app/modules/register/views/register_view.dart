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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: BodyMQW * 0.5,
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
                    height: BodyMQH * 0.06,
                    child: FittedBox(
                      child: Text(
                        'Koperasi Undiksha',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: BodyMQH * 0.03,
                  ),
                  Container(
                    width: BodyMQW,
                    height: BodyMQH * 0.61,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Tidak Boleh Kosong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              label: Text('Masukkan Username/Email'),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: BodyMQH * 0.01,
                        ),
                        Obx(
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
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                label: Text('Masukkan Password'),
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: buttonSembunyikan,
                                    icon: sembunyikan.value
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off))),
                          ),
                        ),
                        SizedBox(
                          height: BodyMQH * 0.01,
                        ),
                        TextFormField(
                          controller: controller.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nama Tidak Boleh Kosong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              label: Text('Masukkan Nama'),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.verified_user)),
                        ),
                        SizedBox(
                          height: BodyMQH * 0.01,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.nim,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "NIM Tidak Boleh Kosong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              label: Text('Masukkan NIM'),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.numbers_outlined)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Sudah Punya Akun?',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(LoginView());
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
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
                            MaterialStatePropertyAll(Color(0xff0E21A0)),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                        ),
                      ),
                      child: Text(
                        'Registrasi',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: BodyMQH * 0.08,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
