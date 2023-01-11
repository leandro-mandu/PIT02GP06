// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class CreditCardTile extends StatelessWidget {
  double limite;
  double utilizado;
  double fatura;
  String nome;
  int diaFechamento;
  int diaVencimento;

  Widget? trailing;
  Function? onTap;
  CreditCardTile({
    Key? key,
    required this.limite,
    required this.utilizado,
    required this.fatura,
    required this.nome,
    required this.diaFechamento,
    required this.diaVencimento,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            nome,
            style: AppTextStyles.textStyle,
          ),
          ListTile(
            onTap: () => onTap,
            leading: Container(
              width: 4,
              color: DateTime.now().day > diaFechamento &&
                      DateTime.now().day < diaVencimento
                  ? AppColors.negativeValue
                  : AppColors.positiveValue,
            ),
            minLeadingWidth: 0,
            title: Text(
              "$fatura",
              style: AppTextStyles.subtitleStyle,
            ),
            trailing: Icon(
              Icons.credit_card,
              color: AppColors.textColor,
            ),
          ),
          Divider(
            thickness: 2,
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.money_off,
                color: AppColors.negativeValue,
              ),
              Text(
                "$utilizado",
                style: AppTextStyles.smallTextStyle,
              ),
              VerticalDivider(),
              Icon(
                Icons.attach_money,
                color: AppColors.positiveValue,
              ),
              Text(
                "${limite - utilizado}",
                style: AppTextStyles.smallTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                color: AppColors.textColor,
              ),
              Text(
                DateTime.now().day > diaFechamento &&
                        DateTime.now().day < diaVencimento
                    ? " Vence dia "
                    : " Fecha dia ",
                style: AppTextStyles.smallTextStyle,
              ),
              Text(
                DateTime.now().day < diaFechamento &&
                        DateTime.now().day > diaVencimento
                    ? "$diaFechamento"
                    : "$diaVencimento",
                style: AppTextStyles.smallTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
