import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/index/wallet/bank_account_controller.dart';
import 'package:u_finance/src/index/wallet/bank_account_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/credit_card_tile.dart';
import 'package:u_finance/widgets/custom_app_bar.dart';
import 'package:u_finance/widgets/custom_progress_indicator.dart';
import 'package:u_finance/widgets/value_tile.dart';

import '../../../widgets/custom_linear_indicator.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final bankAccountController = Modular.get<BankAccountController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Carteira"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Contas",
              style: AppTextStyles.subtitleStyle,
            ),
            IconButton(
              onPressed: () {
                Modular.to.pushNamed("/bank_account_form");
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        Expanded(
          child: Card(
            elevation: 4,
            shadowColor: AppColors.textColor,
            color: AppColors.backgroundColor,
            child: ValueListenableBuilder<BankAccountState>(
              valueListenable: bankAccountController.state,
              builder: (context, value, child) {
                if (value.runtimeType == BankAccountStateLoading) {
                  return const CustomLinearIndicator();
                } else if (value.runtimeType == BankAccountStateSuccess) {
                  final list = (value as BankAccountStateSuccess).list;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ValueTile(
                        value: list[index].saldo,
                        text: list[index].nome,
                      );
                    },
                  );
                }
                return Text("Ocorreu um erro, tente novamente!");
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Cartões",
              style: AppTextStyles.subtitleStyle,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_card),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: Card(
            elevation: 4,
            shadowColor: AppColors.textColor,
            color: AppColors.backgroundColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 200,
                  child: CreditCardTile(
                      limite: 1000,
                      utilizado: 550,
                      fatura: 300,
                      nome: "Inter",
                      diaFechamento: 5,
                      diaVencimento: 10),
                ),
                SizedBox(
                  width: 200,
                  child: CreditCardTile(
                      limite: 1000,
                      utilizado: 550,
                      fatura: 300,
                      nome: "Nubank",
                      diaFechamento: 7,
                      diaVencimento: 15),
                ),
                SizedBox(
                  width: 200,
                  child: CreditCardTile(
                      limite: 1000,
                      utilizado: 550,
                      fatura: 300,
                      nome: "Picpay",
                      diaFechamento: 25,
                      diaVencimento: 31),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
