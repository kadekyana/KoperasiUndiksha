import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/register/views/register_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = Get.put(LoginController());
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
          padding: const EdgeInsets.symmetric(vertical: 50),
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
                    height: BodyMQH * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _loginController.username,
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
                            controller: _loginController.password,
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
                        SizedBox(
                          height: BodyMQH * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Belum Punya Akun?',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(RegisterView());
                                },
                                child: Text(
                                  'Registrasi',
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
                          return _loginController.login(
                              _loginController.username.text,
                              _loginController.password.text);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff0E21A0)),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: BodyMQH * 0.25,
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
