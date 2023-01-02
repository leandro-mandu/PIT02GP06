import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/pages/welcome.dart';
import 'package:u_finance/src/authentication/auth_repository_imp.dart';
import 'package:u_finance/src/authentication/create_account/create_account_controller.dart';
import 'package:u_finance/src/authentication/create_account/create_account_page.dart';
import 'package:u_finance/src/authentication/fire_auth.dart';
import 'package:u_finance/src/authentication/splash/splash_controller.dart';
import 'package:u_finance/src/authentication/splash/splash_page.dart';
import 'package:u_finance/src/index/home/home_page.dart';
import 'package:u_finance/src/index/index_page.dart';

import '../index/home/home_controller.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthRepositoryImpl()),
        Bind.lazySingleton(
            (i) => SplashController(repository: i.get<AuthRepositoryImpl>())),
        Bind.lazySingleton((i) => FireAuth()),
        Bind.lazySingleton(
            (i) => LoginController(repository: i.get<AuthRepositoryImpl>())),
        Bind.lazySingleton((i) =>
            CreateAccountController(repository: i.get<AuthRepositoryImpl>())),
        Bind.lazySingleton(
            (i) => HomeController(authRepository: i.get<AuthRepositoryImpl>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SplashPage()),
        ChildRoute('/welcome', child: (_, args) => Welcome()),
        ChildRoute('/login', child: (_, args) => LoginPage()),
        ChildRoute('/create_account', child: (_, args) => CreateAccountPage()),
        ChildRoute('/home', child: (_, args) => HomePage()),
        ChildRoute('/index', child: (_, args) => IndexPage()),
      ];
}
