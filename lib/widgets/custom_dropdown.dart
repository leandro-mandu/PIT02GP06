import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    Object dropdownValue = 0;
    return DropdownButton(
      style: AppTextStyles.dropdownStyle,
      dropdownColor: AppColors.backgroundCardColor,
      items: const [
        DropdownMenuItem(value: 0, child: Text("17/10 - 23/10")),
        DropdownMenuItem(value: 1, child: Text("outubro 10 - 16")),
      ],
      value: dropdownValue,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
          });
        }
      },
    );
  }
}
