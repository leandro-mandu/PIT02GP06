// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/src/transactions/transactions_state.dart';
import 'package:u_finance/src/transactions/transactions_controller.dart';
import 'package:u_finance/widgets/transaction_tile.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../models/despesa_model.dart';
import '../../models/receita_model.dart';
import '../../utils/app_colors.dart';

class TransactionsPage extends StatefulWidget {
  TransactionsPage({
    super.key,
  });

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final controller = Modular.get<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: ValueListenableBuilder<TransactionsState>(
          valueListenable: controller.state,
          builder: ((context, value, child) {
            if (value.runtimeType == TransactionsStateSuccess) {
              return ListView.builder(
                itemCount:
                    (value as TransactionsStateSuccess).transactionsList.length,
                itemBuilder: (context, index) {
                  return TransactionTile(
                      transaction: value.transactionsList[index]);
                  // return ValueTile(
                  //   value: (value as TransactionsStateSuccess)
                  //       .transactionsList[index]
                  //       .valor,
                  //   text:
                  //       "${(value as TransactionsStateSuccess).transactionsList[index].data.toString()} | id: ${(value as TransactionsStateSuccess).transactionsList[index].id}",
                  //   trailing: IconButton(
                  //     onPressed: () {
                  //       Modular.to.pushNamed('/form', arguments: {
                  //         'type': (value).transactionsList[index].type,
                  //         'transaction': (value).transactionsList[index]
                  //       });
                  //     },
                  //     icon: Icon(Icons.edit),
                  //   ),
                  // );
                },
              );
              //child: ValueTile(value: 3, text: "tres"
            }
            return Text("----");
          }),
        ),
      ),
    );
  }
}
