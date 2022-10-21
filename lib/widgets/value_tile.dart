import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class ValueTile extends StatelessWidget {
  double value;
  String text;
  bool? positive;
  ValueTile({
    Key? key,
    required this.value,
    required this.text,
    this.positive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        color: AppColors.backgroundCardColor,
        child: ListTile(
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
          minLeadingWidth: 5,
          subtitle: Text(
            text,
            style: AppTextStyles.textStyle,
          ),
          title: Text(
            "R\$ $value",
            style: AppTextStyles.subtitleStyle,
          ),
        ),
      ),
    );
  }
}
