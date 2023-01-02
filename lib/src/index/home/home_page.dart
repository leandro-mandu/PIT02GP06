import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/index/home/home_controller.dart';
import 'package:u_finance/src/index/home/home_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/widgets/custom_dropdown.dart';
import 'package:u_finance/widgets/pie_chart.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../../widgets/bar_chart.dart';
import '../../../widgets/custom_progress_indicator.dart';
import '../../../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedBuilder(
              animation: controller.state,
              builder: ((context, child) {
                if (controller.state.value.runtimeType == HomeStateSuccess) {
                  return CustomAppBar(
                    leading: Chip(
                        // avatar: CircleAvatar(
                        //   child: ClipRRect(
                        //       child: Text(
                        //           (controller.state.value as HomeStateSuccess)
                        //               .user
                        //               .displayName!
                        //               .substring(0, 1))),
                        // ),
                        label: Text((controller.state.value as HomeStateSuccess)
                            .user
                            .displayName!
                            .substring(0, 1))),
                    title: "R\$ ${controller.saldo} ",
                    actions: [
                      IconButton(
                        onPressed: () async {
                          await controller.signOut();
                          Modular.to.pushReplacementNamed('/login');
                        },
                        icon: const Icon(Icons.logout_outlined),
                      ),
                    ],
                  );
                } else {
                  return CustomAppBar(
                    title: "",
                  );
                }
              })),
          const SizedBox(height: 8),
          CustomDropdown(listaPeriodos: controller.listaPeriodos),
          Expanded(
            child: ListView(
              //            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ValueTile(
                        value: controller.ganhos,
                        text: 'Ganhos',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ValueTile(
                          value: controller.custos,
                          text: 'Custos',
                          positive: false),
                    ),
                  ],
                ),
                //     ],
                //   ),
                // ),
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
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: BarChart(
                    data: controller.listaCustosPorCategoria,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: AppColors.positiveValue,
            onPressed: () {},
            heroTag: "1",
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            backgroundColor: AppColors.negativeValue,
            onPressed: () {},
            heroTag: "2",
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
