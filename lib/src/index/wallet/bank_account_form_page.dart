import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/auth_repository_imp.dart';

import '../../../models/bank_account_model.dart';
import '../../../models/receita_model.dart';
import 'package:u_finance/src/transactions/transactions_controller.dart';
import 'package:u_finance/src/transactions/transactions_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/widgets/custom_app_bar.dart';

import 'bank_account_controller.dart';
import 'bank_account_state.dart';

class BankAccountFormPage extends StatefulWidget {
  BankAccountModel? bankAccount;
  BankAccountFormPage({Key? key, this.bankAccount}) : super(key: key);

  @override
  State<BankAccountFormPage> createState() => _BankAccountFormPageState();
}

class _BankAccountFormPageState extends State<BankAccountFormPage> {
  final controller = Modular.get<BankAccountController>();
  final saldo = TextEditingController();
  final nome = TextEditingController();
  @override
  void initState() {
    if (widget.bankAccount != null) {
      saldo.text = widget.bankAccount!.saldo.toString();
      nome.text = widget.bankAccount!.nome;
    }
    controller.state.addListener(() {
      switch (controller.state.value.runtimeType) {
        case BankAccountStateSuccess:
          Modular.to.pushReplacementNamed("/index/");
          break;
        case BankAccountStateLoading:
          //const snackBar = SnackBar(content: Text("Carregando..."));
          //ScaffoldMessenger.of(context).showSnackBar(snackBar);

          break;
        case BankAccountStateError:
          final snackBar = SnackBar(
              content: Text(
                  "ERRO! ${(controller.state.value as BankAccountStateError).errorMsg}"));
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
          CustomAppBar(title: "Conta"),
          Text("Nome: "),
          TextField(
            controller: nome,
          ),
          const SizedBox(
            height: 8,
          ),
          Text("Saldo atual: "),
          TextField(
            controller: saldo,
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton.extended(
            heroTag: "0",
            backgroundColor: AppColors.backgroundButtonColor,
            foregroundColor: AppColors.textButtonColor,
            onPressed: () {
              final user = Modular.get<AuthRepositoryImpl>().hasUser();

              final model = BankAccountModel(
                id: widget.bankAccount != null ? widget.bankAccount!.id : null,
                uid: user!.uid,
                nome: nome.text,
                saldo: double.parse(saldo.text),
              );
              controller.save(model);
            },
            icon: Icon(Icons.check),
            label: Text(
                widget.bankAccount != null ? "Salvar alterações" : "Salvar"),
          ),
          const SizedBox(
            height: 8,
          ),
          widget.bankAccount == null
              ? SizedBox()
              : FloatingActionButton.extended(
                  heroTag: '1',
                  backgroundColor: AppColors.negativeValue,
                  foregroundColor: AppColors.textButtonColor,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.delete(widget.bankAccount!.id!);
                  },
                  label: Text("Excluir registro"),
                ),
        ],
      ),
    );
  }
}
