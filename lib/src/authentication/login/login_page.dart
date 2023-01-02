import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/login/login_state.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/custom_app_bar.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _pswController = TextEditingController();
  final controller = Modular.get<LoginController>();
  @override
  void initState() {
    controller.state.addListener(() {
      switch (controller.state.value.runtimeType) {
        case LoginStateSuccess:
          Modular.to.pushReplacementNamed('/home');
          break;
        case LoginStateLoading:
          final snackBar = SnackBar(content: Text("Carregando..."));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          break;
        case LoginStateError:
          final snackBar = SnackBar(
              content: Text(
                  "ERRO! ${(controller.state.value as LoginStateError).errorMsg}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        default:
          final snackBar = SnackBar(content: Text("Estado default"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "u-Finance"),
          SizedBox(
            height: 16,
          ),
          Text(
            "Fazer login",
            style: AppTextStyles.subtitleStyle,
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _mailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text(
                        "Email",
                        style: AppTextStyles.textStyle,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _pswController,
                      obscureText: true,
                      decoration: InputDecoration(
                          label: Text(
                        "Senha",
                        style: AppTextStyles.textStyle,
                      )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.login(
                          _mailController.text, _pswController.text);
                    },
                    child: Text("Entrar"),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ainda não tem uma conta?  ",
                style: AppTextStyles.smallTextStyle,
              ),
              OutlinedButton(
                onPressed: () {
                  Modular.to.pushNamed('/create_account');
                },
                child: Text("Criar uma conta"),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              Modular.to.pushNamed('/home');
            },
            child: Text("Seguir sem criar conta"),
          ),
        ],
      ),
    );
  }
}
