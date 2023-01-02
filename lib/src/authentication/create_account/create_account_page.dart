import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/src/authentication/create_account/create_account_controller.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/custom_app_bar.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _pswController = TextEditingController();
  final controller = Modular.get<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "u-Finance"),
          SizedBox(
            height: 16,
          ),
          Text(
            "Criar uma conta",
            style: AppTextStyles.subtitleStyle,
          ),
          Form(
            key: _formKey,
            child: Expanded(
//              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          label: Text(
                        "Nome",
                        style: AppTextStyles.textStyle,
                      )),
                    ),
                  ),
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
                    onPressed: () {
                      controller.createAccount(_nameController.text,
                          _mailController.text, _pswController.text);
                    },
                    child: Text("Criar conta"),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Já tem uma conta?  ",
                        style: AppTextStyles.smallTextStyle,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Modular.to.pushNamed('/login');
                        },
                        child: Text("Fazer login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
