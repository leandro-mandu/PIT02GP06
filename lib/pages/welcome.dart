import 'package:flutter/material.dart';
import 'package:u_finance/pages/add_ticker.dart';
import 'package:u_finance/pages/home.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';

import '../widgets/custom_fab_button.dart';
import '../widgets/title_container.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: ListView(
          children: [
            TitleContainer(
              title: "u-Finance",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Text(
                    "Organização financeira para motoristas de aplicativo!",
                    style: AppTextStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  Divider(
                    color: AppColors.textColor,
                    thickness: 1,
                  ),
                  const Divider(),
                  Text(
                    "[V] Definição de semana com início na segunda feira para se adequar a seus aplicativos de trabalho",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Organize cada gasto separadamente",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Lançamento de custos recorrentes como prestações e seguros",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Relatório para imposto de renda",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Organização dos lucros separados por aplicativo",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Preços de postos de combustível (colaborativo)",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Relatório de gastos por categoria",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Lembrete de revisão do veículo",
                    style: AppTextStyles.textStyle,
                  ),
                  const Divider(),
                  Text(
                    "[V] Calculadora de consumo",
                    style: AppTextStyles.textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFabButton(
        text: "Junte-se ao u-Finance  ",
        icon: Icons.navigate_next,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
