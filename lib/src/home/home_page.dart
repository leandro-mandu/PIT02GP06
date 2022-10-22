import 'package:flutter/material.dart';
import 'package:u_finance/src/home/home_controller.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/widgets/custom_dropdown.dart';
import 'package:u_finance/widgets/pie_chart.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../widgets/bar_chart.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../../widgets/title_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  @override
  void initState() {
    controller = HomeController(onUpdate: () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleContainer(title: "R\$ 0,00"),
            const SizedBox(height: 16),
            CustomDropdown(listaPeriodos: controller.listaPeriodos),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ValueTile(value: 0.5, text: 'Ganhos'),
                ValueTile(value: 0.8, text: 'Custos', positive: false),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 350,
              height: 300,
              child: controller.listaGanhosPorCategoria.isEmpty
                  ? const CustomProgressIndicator()
                  : PieChart(
                      data: controller.listaGanhosPorCategoria,
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 350,
              height: 300,
              child: controller.listaCustosPorCategoria.isEmpty
                  ? const CircularProgressIndicator()
                  : PieChart(
                      data: controller.listaCustosPorCategoria,
                    ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: BarChart(),
            ),
          ],
        ),
      ),
    );

    // ListView(
    //   children: [
    //     TitleContainer(title: "R\$ 0,00"),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         valueTile(value: 150.80, text: "Ganhos"),
    //         valueTile(value: 60, text: "Custos"),
    //       ],
    //     ),
    //     Card(
    //       color: AppColors.backgroundCardColor,
    //       child: valueTile(
    //         value: 150.18,
    //         text: "Ganhos",
    //         positive: false,
    //       ),
    //     )
    //   ],
    // );
  }
}
