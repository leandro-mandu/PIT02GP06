import 'package:flutter/material.dart';
import 'package:u_finance/utils/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          backgroundColor: AppColors.negativeValue,
          color: AppColors.backgroundButtonColor,
        ),
      ),
    );
  }
}
