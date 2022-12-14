import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class ValueTile extends StatelessWidget {
  double value;
  String text;
  bool? positive;
  Widget? trailing;
  Function? onTap;
  ValueTile({
    Key? key,
    required this.value,
    required this.text,
    this.positive,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundCardColor,
      child: ListTile(
        onTap: () => onTap,
        leading: Container(
          width: 3,
          height: 50,
          color: positive == null
              ? value == 0
                  ? AppColors.titleColor
                  : value > 0
                      ? AppColors.positiveValue
                      : AppColors.negativeValue
              : positive!
                  ? AppColors.positiveValue
                  : AppColors.negativeValue,
        ),
        minLeadingWidth: 0,
        subtitle: Text(
          text,
          style: AppTextStyles.textStyle,
        ),
        title: Text(
          positive == false ? "-$value" : "$value",
          style: AppTextStyles.subtitleStyle,
        ),
        trailing: trailing,
      ),
    );
  }
}
