import 'package:flutter/material.dart';
import 'package:u_finance/utils/app_colors.dart';

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
        backgroundColor: AppColors.backgroundColor,
        color: AppColors.backgroundCardColor,
      ),
    );
  }
}
