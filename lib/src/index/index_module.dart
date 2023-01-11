import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/welcome.dart';
import 'package:u_finance/src/authentication/auth_repository_imp.dart';
import 'package:u_finance/src/authentication/create_account/create_account_controller.dart';
import 'package:u_finance/src/authentication/create_account/create_account_page.dart';
import 'package:u_finance/src/authentication/fire_auth.dart';
import 'package:u_finance/src/authentication/splash/splash_controller.dart';
import 'package:u_finance/src/authentication/splash/splash_page.dart';
import 'package:u_finance/src/index/home/home_page.dart';
import 'package:u_finance/src/index/index_page.dart';
import 'package:u_finance/src/index/wallet/bank_account_controller.dart';
import 'package:u_finance/src/index/wallet/bank_account_form_page.dart';
import 'package:u_finance/src/index/wallet/bank_account_repository.dart';
import 'package:u_finance/src/transactions/transactions_page.dart';
import 'package:u_finance/src/transactions/transaction_form_page.dart';
import 'package:u_finance/src/transactions/transactions_controller.dart';
import 'package:u_finance/src/transactions/transactions_repository.dart';

import '../index/home/home_controller.dart';

class IndexModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthRepositoryImpl()),
        Bind.lazySingleton((i) => TransactionsRepository()),
        Bind.lazySingleton((i) => BankAccountRepository()),
        // Bind.lazySingleton(
        //     (i) => SplashController(repository: i.get<AuthRepositoryImpl>())),
        // Bind.lazySingleton((i) => FireAuth()),
        // Bind.lazySingleton(
        //     (i) => LoginController(repository: i.get<AuthRepositoryImpl>())),
        // Bind.lazySingleton((i) =>
        //     CreateAccountController(repository: i.get<AuthRepositoryImpl>())),
        Bind.lazySingleton(
            (i) => HomeController(authRepository: i.get<AuthRepositoryImpl>())),
        Bind.singleton((i) => TransactionsController()),
        Bind.singleton((i) => BankAccountController()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => IndexPage()),
        ChildRoute('/home', child: (_, args) => HomePage()),
        ChildRoute('/transactions', child: (_, args) => TransactionsPage()),
        // ChildRoute('/bank_account_form',
        //     child: (_, args) => BankAccountFormPage()),
        ChildRoute('/form',
            child: (_, args) => TransactionFormPage(
                  transaction: args.data['transaction'],
                  type: args.data['type'],
                )),
      ];
}
