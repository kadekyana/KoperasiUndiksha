import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanController extends GetxController {
  //TODO: Implement ScanController
  Barcode? result;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    setState() {
      this.controller = controller;
    }

    controller.scannedDataStream.listen((scanData) {
      setState() {
        result = scanData;
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
