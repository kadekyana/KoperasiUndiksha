import 'package:get/get.dart';
import 'package:pemmob_lanjut/app/modules/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  void Getstart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Getstart', true);
    Get.to(LoginView());
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
