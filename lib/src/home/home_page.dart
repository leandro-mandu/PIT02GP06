import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../widgets/title_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          TitleContainer(title: "R\$ 0,00"),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              valueTile(value: 0.5, text: 'Ganhos'),
              valueTile(value: 0.8, text: 'Custos', positive: false),
            ],
          ),
        ],
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
