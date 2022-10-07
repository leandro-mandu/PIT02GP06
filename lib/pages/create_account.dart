import 'package:flutter/material.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/widgets/title_container.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: ListView(
          children: [TitleContainer(title: "Crie uma conta")],
        ),
      ),
    );
  }
}
