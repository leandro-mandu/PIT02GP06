import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:u_finance/src/home/home_page.dart';
import 'package:u_finance/utils/app_colors.dart';
import 'package:u_finance/utils/app_text_styles.dart';
import 'package:u_finance/widgets/title_container.dart';

import '../../widgets/home_bottom_nav_bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: PreferredSize(
      //   child: TitleContainer(title: "R\$ 0,00"),
      //   preferredSize: MediaQuery.of(context).size,
      // ),
      body: PageView(
        children: [
          HomePage(),
          Icon(
            Icons.money,
            color: AppColors.backgroundButtonColor,
            semanticLabel: "Saldo",
            size: 200,
          ),
          Icon(
            Icons.credit_card,
            color: AppColors.backgroundButtonColor,
            semanticLabel: "Credito",
            size: 200,
          ),
          Icon(
            Icons.account_balance,
            color: AppColors.backgroundButtonColor,
            semanticLabel: "Conta",
            size: 200,
          ),
        ],
      ),
      bottomNavigationBar: homeBottomNavBar(),
    );
  }
}
