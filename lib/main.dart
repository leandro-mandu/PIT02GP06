import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/app_module.dart';
import 'package:u_finance/src/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
