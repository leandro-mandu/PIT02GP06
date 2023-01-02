import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule()),
      ];
}
