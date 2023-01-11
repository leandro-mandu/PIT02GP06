import 'package:flutter/material.dart';
import 'package:u_finance/src/index/home/home_page.dart';
import 'package:u_finance/src/index/wallet/wallet_page.dart';
import 'package:u_finance/src/transactions/transactions_page.dart';
import 'package:u_finance/utils/app_colors.dart';

import '../../widgets/home_bottom_nav_bar.dart';

class IndexPage extends StatefulWidget {
//  UserModel user;
  IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(),
          TransactionsPage(),
          Icon(
            Icons.credit_card,
            color: AppColors.backgroundButtonColor,
            semanticLabel: "Credito",
            size: 200,
          ),
          WalletPage(),
          // Icon(
          //   Icons.wallet,
          //   color: AppColors.backgroundButtonColor,
          //   semanticLabel: "Carteira",
          //   size: 200,
          // ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavBar(pageController: pageController),
    );
  }
}
