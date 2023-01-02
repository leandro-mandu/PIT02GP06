import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_finance/models/despesa_model.dart';
import 'package:u_finance/models/receita_model.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/src/index/home/home_state.dart';

import '../../authentication/auth_repository.dart';

class HomeController {
  ValueNotifier<HomeState> state = ValueNotifier(HomeStateLoading());
  final AuthRepository authRepository;
  List<TransacaoModel> listaTransacoes = [];
  double saldo = 0.0;
  double ganhos = 0.0;
  double custos = 0.0;

  late final listaPeriodos;
  late final List<Map<String, Object>> listaGanhosPorCategoria;
  late final List<Map<String, Object>> listaCustosPorCategoria;
  HomeController({required this.authRepository}) {
    init();
  }

  init() async {
    // listaTransacoes
    //     .add(ReceitaModel(data: DateTime.now(), valor: 100, contaId: 0));
    // listaTransacoes
    //     .add(DespesaModel(data: DateTime.now(), valor: -70, contaId: 0));
    // listaTransacoes
    //     .add(ReceitaModel(data: DateTime.now(), valor: 50, contaId: 0));
    // listaTransacoes
    //     .add(DespesaModel(data: DateTime.now(), valor: -23, contaId: 0));
    // listaTransacoes
    //     .add(ReceitaModel(data: DateTime.now(), valor: 20, contaId: 0));
    // listaTransacoes
    //     .add(ReceitaModel(data: DateTime.now(), valor: 30, contaId: 0));
    // listaTransacoes
    //     .add(DespesaModel(data: DateTime.now(), valor: -80, contaId: 0));
    // listaTransacoes.forEach((e) {
    //   saldo += e.valor;
    //   if (e.valor > 0)
    //     ganhos += e.valor;
    //   else
    //     custos += e.valor;
    // });

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
      {'genre': 'Uber', 'sold': 15, 'color': Color.fromARGB(255, 0, 22, 133)},
      {'genre': '99', 'sold': 10, 'color': Color.fromARGB(255, 255, 230, 0)},
      {'genre': 'Indriver', 'sold': 5, 'color': Colors.green},
      {
        'genre': 'Outros',
        'sold': 0,
        'color': Color.fromARGB(255, 255, 102, 102)
      },
    ];
    await Future.delayed(const Duration(seconds: 2));
    final user = authRepository.hasUser();
    if (user != null) {
      state.value = HomeStateSuccess(user: user);
    } else {
      state.value = HomeStateError();
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
