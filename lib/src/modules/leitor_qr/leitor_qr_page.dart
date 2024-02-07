import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';

import 'leitor_qr_controller.dart';
import 'leitor_qr_module.dart';

class LeitorQrPage extends StatefulWidget {
  final String title;

  const LeitorQrPage({Key? key, this.title = "Leitor Qr"}) : super(key: key);

  @override
  LeitorQrPageState createState() => LeitorQrPageState();
}

class LeitorQrPageState extends State<LeitorQrPage> {
  final LeitorQrController controller =
      LeitorQrModule.to.bloc<LeitorQrController>();

  @override
  void initState() {
    super.initState();

    controller.captureController.onCapture((data) {
      controller.captureController.pause();
      Navigator.pop(context, data);
    });
  }

  @override
  void dispose() {
    controller.captureController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            QRCaptureView(controller: controller.captureController),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildToolBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToolBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (controller.isPaused) {
                controller.isPaused = false;
                controller.captureController.resume();
              } else {
                controller.isPaused = true;
                controller.captureController.pause();
              }
            });
          },
          icon: Icon(controller.isPaused ? Icons.play_arrow : Icons.pause),
          //child: Text('pause'),
        ),
        IconButton(
          onPressed: () {
            if (controller.isTorchOn) {
              controller.captureController.torchMode = CaptureTorchMode.off;
            } else {
              controller.captureController.torchMode = CaptureTorchMode.on;
            }
            setState(() {
              controller.isTorchOn = !controller.isTorchOn;
            });
          },
          icon: Icon(controller.isTorchOn ? Icons.flash_on : Icons.flash_off),
        ),
      ],
    );
  }
}
