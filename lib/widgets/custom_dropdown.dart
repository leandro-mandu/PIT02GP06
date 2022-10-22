import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropdown extends StatefulWidget {
  final listaPeriodos;
  const CustomDropdown({super.key, required this.listaPeriodos});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Object dropdownValue = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: AppTextStyles.dropdownStyle,
      dropdownColor: AppColors.backgroundCardColor,
      items: widget.listaPeriodos,
      value: dropdownValue,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
            log("selecionado $value");
          });
        }
      },
    );
  }
}
