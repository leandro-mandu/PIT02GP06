import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class PieChart extends StatefulWidget {
  final List<Map<String, Object>> data;
  const PieChart({super.key, required this.data});

  @override
  State<PieChart> createState() => _PieChartState(data: data);
}

class _PieChartState extends State<PieChart> {
  final data;
  List<Color> cores = [];
  _PieChartState({this.data}) {
    cores = List.from(data.map((e) => e['color']));
    log(cores.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Chart(
      data: data,
      variables: {
        'genre': Variable(
          accessor: (Map map) => map['genre'] as String,
        ),
        'sold': Variable(
          accessor: (Map map) => map['sold'] as num,
        ),
      },
      transforms: [
        Proportion(
          variable: 'sold',
          as: 'percent',
        )
      ],
      elements: [
        IntervalElement(
          position: Varset('percent') / Varset('genre'),
          label: LabelAttr(
              encoder: (tuple) => Label(
                    tuple['sold'].toString(),
                    LabelStyle(style: Defaults.runeStyle),
                  )),
          color: ColorAttr(variable: 'genre', values: cores),
          modifiers: [StackModifier()],
        )
      ],
      coord: PolarCoord(transposed: true, dimCount: 1),
    );
  }
}
