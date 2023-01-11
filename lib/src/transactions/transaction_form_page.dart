// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:u_finance/models/despesa_model.dart';
import 'package:u_finance/models/receita_model.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/src/transactions/transactions_controller.dart';
import 'package:u_finance/src/transactions/transactions_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/widgets/custom_app_bar.dart';

class TransactionFormPage extends StatefulWidget {
  TransactionModel? transaction;
  String type;
  TransactionFormPage({Key? key, this.transaction, required this.type})
      : super(key: key);

  @override
  State<TransactionFormPage> createState() => _TransactionFormPageState();
}

class _TransactionFormPageState extends State<TransactionFormPage> {
  final controller = Modular.get<TransactionsController>();
  final value = TextEditingController();
  @override
  void initState() {
    if (widget.transaction != null)
      value.text = widget.transaction!.valor.toString();
    controller.state.addListener(() {
      switch (controller.state.value.runtimeType) {
        case TransactionsStateSuccess:
          Modular.to.pushReplacementNamed("/index/");
          break;
        case TransactionsStateLoading:
          //const snackBar = SnackBar(content: Text("Carregando..."));
          //ScaffoldMessenger.of(context).showSnackBar(snackBar);

          break;
        case TransactionsStateError:
          final snackBar = SnackBar(
              content: Text(
                  "ERRO! ${(controller.state.value as TransactionsStateError).errorMsg}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        default:
          const snackBar = SnackBar(content: Text("Estado default"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: widget.type.toString()),
          TextField(
            controller: value,
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton.extended(
            heroTag: "0",
            backgroundColor: AppColors.backgroundButtonColor,
            foregroundColor: AppColors.textButtonColor,
            onPressed: () {
              final transaction = ReceitaModel(
                  id: widget.transaction != null
                      ? widget.transaction!.id
                      : null,
                  type: widget.type,
                  data: DateTime.now(),
                  valor: double.parse(value.text),
                  contaId: "10");
              controller.saveTransaction(transaction);
            },
            icon: Icon(Icons.check),
            label: Text(
                widget.transaction != null ? "Salvar alterações" : "Salvar"),
          ),
          const SizedBox(
            height: 8,
          ),
          widget.transaction == null
              ? SizedBox()
              : FloatingActionButton.extended(
                  heroTag: '1',
                  backgroundColor: AppColors.negativeValue,
                  foregroundColor: AppColors.textButtonColor,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.delete(widget.transaction!.id!);
                  },
                  label: Text("Excluir registro"),
                ),
        ],
      ),
    );
  }
}
