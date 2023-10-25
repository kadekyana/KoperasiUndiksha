import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/CustomOvalButton/views/custom_oval_button_view.dart';
import 'package:pemmob_lanjut/app/modules/MyAppBar/views/my_app_bar_view.dart';
import 'package:pemmob_lanjut/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:pemmob_lanjut/app/modules/login/controllers/login_controller.dart';
import 'package:pemmob_lanjut/app/modules/scan/views/scan_view.dart';
import 'package:pemmob_lanjut/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:pemmob_lanjut/app/modules/transfer/views/transfer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> ListCards = [
    {
      'image':
          'https://cdn.undiksha.ac.id/wp-content/uploads/2023/10/06142802/Undiksha-gelar-FGG-Pedoman-Magang-1200x650.jpg',
      'title': 'Pelaksanaan Magang, Undiksha Sempurnakan Panduan',
      'description':
          'Singaraja- Universitas Pendidikan Ganesha (Undiksha) kembali turut ambil bagian dalam ajang Lembaga Pendidikan Tenaga Kependidikan (LPTK) Cup XXI yang berlangsung di Universitas Negeri Malang dari 1 sampai 4 Oktober 2023. ',
    },
    {
      'image':
          'https://cdn.undiksha.ac.id/wp-content/uploads/2023/10/02095812/Pengukuhan-dan-Pelepasan-Kontingen-LPTK-Cup-Undiksha-1200x650.jpeg',
      'title': 'Undiksha Berlaga di LPTK Cup, Diajak Junjung Sportivitas',
      'description':
          'Singaraja- Universitas Pendidikan Ganesha (Undiksha) menjadikan program magang sebagai salah satu upaya untuk meningkatkan kompetensi mahasiswa maupun lulusan. Pelaksanaan program ini diharapkan dapat semakin baik dan semakin berkualitas.',
    },
    {
      'image':
          'https://cdn.undiksha.ac.id/wp-content/uploads/2023/10/02101235/Sosialisasi-Penyalahgunaan-Napza-1200x650.jpeg',
      'title':
          'Gandeng BNNK Buleleng, Undiksha Ajak Cegah Penyalahgunaan Napza',
      'description':
          'Singaraja- Universitas Pendidikan Ganesha (Undiksha) melalui Lembaga Penjaminan Mutu dan Pengembangan Pembelajaran (LPMPP) melaksanakan kegiatan Sosialisasi Pencegahan Penggunaan Napza di lingkungan Kampus Undiksha, Selasa (26/9/2023).',
    },
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final LoginController loginSp = Get.find<LoginController>();
  final HomeController homeSp = Get.find<HomeController>();
  final SplashscreenController Ss = Get.find<SplashscreenController>();
  bool showSaldo = true;

  //

  @override
  void initState() {
    super.initState();
    setState(() {});
    Ss.cekLogin();
    print(Ss.data);
  }

  @override
  Widget build(BuildContext context) {
    final FMQW = MediaQuery.of(context).size.width;
    final FMQH = MediaQuery.of(context).size.height;
    final PT = MediaQuery.of(context).padding.top;

    final BMQH = FMQH - MyAppBarView().preferredSize.height - PT;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: FMQW,
              height: BMQH * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: FMQW,
                    height: BMQH * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        'images/bg.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: 10,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: -50,
                  left: 35,
                  child: Container(
                    width: FMQW * 0.8,
                    height: BMQH * 0.15,
                    child: Card(
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Welcome ${loginSp.data.isNotEmpty ? loginSp.data[0]['nama'] : Ss.data[0]['nama']}',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Visibility(
                                      replacement: Text(
                                        'Rp. *.***.***.***,**',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      visible: showSaldo,
                                      child: Text(
                                        homeSp.formatStringToRupiah(
                                            loginSp.data.isNotEmpty
                                                ? loginSp.data[0]['saldo']
                                                : Ss.data[0]['saldo']),
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: showSaldo
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        showSaldo = !showSaldo;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: BMQH * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(TransferView());
                  },
                  child: Container(
                    width: FMQW * 0.25,
                    height: BMQH * 0.15,
                    child: Card(
                      color: Colors.indigo[900],
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_vert_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            'Transfer',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ScanView());
                  },
                  child: Container(
                    width: FMQW * 0.25,
                    height: BMQH * 0.15,
                    child: Card(
                      elevation: 6,
                      color: Colors.indigo[900],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            'Scanner',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 2,
            ),
            SizedBox(
              width: FMQW,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Kabar Undiksha',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                autoPlayInterval: Duration(seconds: 30),
                enlargeCenterPage: true,
              ),
              items: ListCards.map((card) {
                return Builder(builder: (BuildContext context) {
                  return CardItem(
                      image: card['image']!,
                      title: card['title']!,
                      description: card['description']!);
                });
              }).toList(),

              // imgList
              //     .map((item) => Container(
              //           child: Center(
              //               child: Image.network(item,
              //                   fit: BoxFit.cover, height: 100, width: 1000)),
              //         ))
              //     .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
