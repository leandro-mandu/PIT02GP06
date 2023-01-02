import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../models/despesa_model.dart';
import '../../models/receita_model.dart';
import '../../utils/app_colors.dart';

class TransacoesPage extends StatelessWidget {
  List<TransacaoModel> listaTransacoes;
  TransacoesPage({super.key, required this.listaTransacoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: ListView.builder(
            itemCount: listaTransacoes.length,
            itemBuilder: (context, index) {
              return ValueTile(
                  value: listaTransacoes[index].valor,
                  text:
                      "${listaTransacoes[index].data.day} / ${listaTransacoes[index].data.month} / ${listaTransacoes[index].data.year}");
            }),
      ),
    );
  }
}
