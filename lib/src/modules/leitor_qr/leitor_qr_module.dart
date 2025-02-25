import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'leitor_qr_controller.dart';
import 'leitor_qr_page.dart';

// ignore: use_key_in_widget_constructors
class LeitorQrModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LeitorQrController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LeitorQrPage();

  static Inject get to => Inject<LeitorQrModule>.of();
}
