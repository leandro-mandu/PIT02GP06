import 'package:flutter/material.dart';
import 'package:u_finance/widgets/custom_progress_indicator.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String title;
  List<Widget>? actions;
  Widget? leading;

  CustomAppBar({
    this.leading,
    required this.title,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundCardColor,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(30, 30))),
//              BorderRadius.only(bottomRight: Radius.circular(80))),
      leading: leading,
      title: title.isEmpty
          ? CustomProgressIndicator()
          : Text(
              title,
              style: AppTextStyles.titleStyle,
            ),
      centerTitle: true,
      actions: actions,
    );
  }
}
