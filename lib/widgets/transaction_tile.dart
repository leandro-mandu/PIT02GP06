import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class TransactionTile extends StatelessWidget {
  TransactionModel transaction;
  TransactionTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueTile(
      value: transaction.valor,
      text: transaction.id ?? "NoSync",
      positive: transaction.type == "ReceitaModel" ? true : false,
      trailing: IconButton(
        onPressed: () {
          Modular.to.pushNamed(
            '/form',
            arguments: {
              'type': transaction.type,
              'transaction': transaction,
            },
          );
        },
        icon: Icon(Icons.edit),
      ),
    );
  }
}
