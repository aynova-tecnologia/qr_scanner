import 'package:qrcode/qrcode.dart';

class LeitorQrController {
  final QRCaptureController captureController = QRCaptureController();
  bool isTorchOn = false;
  bool isPaused = false;
}
