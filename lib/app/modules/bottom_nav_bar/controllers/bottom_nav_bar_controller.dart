import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  //TODO: Implement BottomNavBarController

  var selectedIndex = 0.obs;

  void Pages(int Index) {
    selectedIndex.value = Index;
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
