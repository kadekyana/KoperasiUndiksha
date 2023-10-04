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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[900],
        title: Text('Koperasi Undiksha'),
        centerTitle: true,
      ),
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
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image(
                  image: AssetImage('images/Logo_undiksha.png'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.blue,
              ),
              child: Card(
                elevation: 10,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 5, horizontal: 10),
                        //   child: Container(
                        //     width: 100,
                        //     height: 30,
                        //     padding: EdgeInsets.only(top: 10, left: 10),
                        //     child: Text(
                        //       'Username',
                        //       style: TextStyle(fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: _loginController.username,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Username tidak boleh kosong';
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              label: Text('Masukkan Username'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10, left: 20),
                        //   child: Container(
                        //     width: 100,
                        //     height: 30,
                        //     padding: EdgeInsets.only(top: 10),
                        //     child: Text(
                        //       'Password',
                        //       style: TextStyle(fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Obx(
                            () => TextFormField(
                              controller: _loginController.password,
                              obscureText: !sembunyikan.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Tidak Boleh Kosong";
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Masukkan Password'),
                                suffixIcon: IconButton(
                                    onPressed: buttonSembunyikan,
                                    icon: sembunyikan.value
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Center(
                            child: FilledButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  return _loginController.login(
                                      _loginController.username.text,
                                      _loginController.password.text);
                                }
                                // login(username.text, password.text);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: ((context) => Home()),
                                //   ),
                                // );
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.indigo[900]),
                                  elevation: MaterialStatePropertyAll(10),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 5))),
                              child: Text('Login'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterView(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Daftar Mbanking',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Lupa Password ?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
