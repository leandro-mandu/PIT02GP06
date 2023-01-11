import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/auth_module.dart';
import 'package:u_finance/src/index/index_module.dart';
import 'package:u_finance/src/index/transactions/transaction_form_page.dart';

import 'index/wallet/bank_account_form_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule()),
        ModuleRoute('/index', module: IndexModule()),
        // ChildRoute('/form',
        //     child: (_, args) => TransactionFormPage(
        //           transaction: args.data['transaction'],
        //           type: args.data['type'],
        //         )),
        ChildRoute('/bank_account_form',
            child: (_, args) => BankAccountFormPage()),
      ];
}
