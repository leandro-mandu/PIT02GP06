import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class TitleContainer extends StatelessWidget {
  String title;
  TitleContainer({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.elliptical(80, 80))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Text(
            title,
            style: AppTextStyles.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
