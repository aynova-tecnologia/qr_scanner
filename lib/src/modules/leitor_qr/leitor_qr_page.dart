import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'leitor_qr_controller.dart';
import 'leitor_qr_module.dart';

class LeitorQrPage extends StatefulWidget {
  final String title;

  const LeitorQrPage({Key? key, this.title = "Leitor Qr"}) : super(key: key);

  @override
  _LeitorQrPageState createState() => _LeitorQrPageState();
}

class _LeitorQrPageState extends State<LeitorQrPage> {
  final LeitorQrController controller =
      LeitorQrModule.to.bloc<LeitorQrController>();

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  Future<void> _scanQR() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Cor de fundo do cabeçalho
        "Cancelar", // Texto do botão de cancelamento
        true, // Mostrar botão de flash
        ScanMode.QR, // Modo de digitalização (QR, BARCODE, etc.)
      );

      if (barcode.isNotEmpty && barcode != '-1') {
        Navigator.pop(context, barcode);
      }
    } catch (e) {
      print('Erro ao escanear código QR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}