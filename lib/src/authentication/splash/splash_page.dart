import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/splash/splash_controller.dart';
import 'package:u_finance/src/authentication/splash/splash_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/custom_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      final controller = Modular.get<SplashController>();
      controller.state.addListener(() {
        log("Estado Alterado ${controller.state.value.runtimeType}");
        if (controller.state.value.runtimeType == SplashStateAuthenticated) {
          Modular.to.pushReplacementNamed('/index');
        } else {
          Modular.to.pushReplacementNamed('/welcome');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("u-Finance", style: AppTextStyles.titleStyle),
            const SizedBox(height: 8),
            Text("for drivers", style: AppTextStyles.textStyle),
            const SizedBox(height: 30),
            const CustomProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
