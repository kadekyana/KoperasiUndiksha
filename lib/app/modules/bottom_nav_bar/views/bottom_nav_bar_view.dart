import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/Activity/views/activity_view.dart';
import 'package:pemmob_lanjut/app/modules/Mutasi/views/mutasi_view.dart';
import 'package:pemmob_lanjut/app/modules/home/views/home_view.dart';
import 'package:pemmob_lanjut/app/modules/profile/views/profile_view.dart';
import 'package:pemmob_lanjut/app/modules/scan/views/scan_view.dart';
import 'package:pemmob_lanjut/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:pemmob_lanjut/app/modules/transfer/views/transfer_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  SplashscreenController controller = Get.put(SplashscreenController());
  int selectedIndex = 0;
  List<Widget> body = [HomeView(), ActivityView(), MutasiView(), ProfileView()];

  void tapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff190482),
          currentIndex: selectedIndex,
          onTap: tapItem,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home_rounded),
              title: Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.email_rounded),
              title: Text('Mutasi'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.list),
              title: Text('Mutasi'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ]),
    );
  }
}
