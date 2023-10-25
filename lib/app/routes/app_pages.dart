import 'package:get/get.dart';

import '../modules/Activity/bindings/activity_binding.dart';
import '../modules/Activity/views/activity_view.dart';
import '../modules/AfterSplash/bindings/after_splash_binding.dart';
import '../modules/AfterSplash/views/after_splash_view.dart';
import '../modules/CreditCard/bindings/credit_card_binding.dart';
import '../modules/CreditCard/views/credit_card_view.dart';
import '../modules/CustomOvalButton/bindings/custom_oval_button_binding.dart';
import '../modules/DetailTransfer/bindings/detail_transfer_binding.dart';
import '../modules/DetailTransfer/views/detail_transfer_view.dart';
import '../modules/Mutasi/bindings/mutasi_binding.dart';
import '../modules/Mutasi/views/mutasi_view.dart';
import '../modules/MyAppBar/bindings/my_app_bar_binding.dart';
import '../modules/MyAppBar/views/my_app_bar_view.dart';
import '../modules/Onboarding/bindings/onboarding_binding.dart';
import '../modules/Onboarding/views/onboarding_view.dart';
import '../modules/PageQrCode/bindings/page_qr_code_binding.dart';
import '../modules/PageQrCode/views/page_qr_code_view.dart';
import '../modules/Sukses/bindings/sukses_binding.dart';
import '../modules/Sukses/views/sukses_view.dart';
import '../modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        bindings: [HomeBinding(), LoginBinding()]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      bindings: [LoginBinding(), HomeBinding()],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => TransferView(
        qrResult: '',
      ),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_APP_BAR,
      page: () => MyAppBarView(),
      binding: MyAppBarBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSFER,
      page: () => DetailTransferView(
        data: null,
      ),
      binding: DetailTransferBinding(),
    ),
    GetPage(
      name: _Paths.SUKSES,
      page: () => const SuksesView(),
      binding: SuksesBinding(),
    ),
    GetPage(
      name: _Paths.MUTASI,
      page: () => const MutasiView(),
      binding: MutasiBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.AFTER_SPLASH,
      page: () => const AfterSplashView(),
      binding: AfterSplashBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_QR_CODE,
      page: () => PageQrCodeView(),
      binding: PageQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.CREDIT_CARD,
      page: () => const CreditCardView(),
      binding: CreditCardBinding(),
    ),
  ];
}
