import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/login/controllers/login_controller.dart';

class MyAppBarView extends StatelessWidget implements PreferredSizeWidget {
  final LoginController loginSp = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo[900],
      title: Text('Koperasi Undiksha'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            loginSp.logout();
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
