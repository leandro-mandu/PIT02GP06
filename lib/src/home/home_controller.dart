import 'package:flutter/material.dart';

class HomeController {
  late final listaPeriodos;
  late final List<Map<String, Object>> listaGanhosPorCategoria;
  late final List<Map<String, Object>> listaCustosPorCategoria;
  final VoidCallback onUpdate;
  HomeController({required this.onUpdate}) {
    init();
  }
  void updateState() {
    onUpdate();
  }

  init() {
    listaPeriodos = const [
      DropdownMenuItem(value: 0, child: Text("17 out - 23 out")),
      DropdownMenuItem(value: 1, child: Text("10 out - 16 out")),
      DropdownMenuItem(value: 2, child: Text("3 out - 9 out")),
      DropdownMenuItem(value: 3, child: Text("26 set - 2 out")),
    ];

    listaCustosPorCategoria = [
      {'genre': 'Gasolina', 'sold': 200, 'color': Colors.yellow},
      {'genre': 'Alugel', 'sold': 500, 'color': Colors.green},
      {'genre': 'Alimentação', 'sold': 100, 'color': Colors.blue},
      {'genre': 'Manutenção', 'sold': 80, 'color': Colors.red},
      {'genre': 'Outros', 'sold': 25, 'color': Colors.black26},
    ];
    listaGanhosPorCategoria = [
      {'genre': 'Uber', 'sold': 250, 'color': Colors.black},
      {'genre': '99', 'sold': 520, 'color': Colors.yellow},
      {'genre': 'Indriver', 'sold': 100, 'color': Colors.green},
      {'genre': 'Outros', 'sold': 25, 'color': Colors.blue},
    ];
    updateState();
  }
}
