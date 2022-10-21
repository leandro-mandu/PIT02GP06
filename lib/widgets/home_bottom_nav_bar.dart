import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class homeBottomNavBar extends StatelessWidget {
  const homeBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
//        fixedColor: Colors.red,
//        backgroundColor: AppColors.backgroundButtonColor,
      selectedItemColor: AppColors.titleColor,
      unselectedItemColor: AppColors.textColor,
      /*
      selectedIconTheme: IconThemeData(
        color: AppColors.textButtonColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.textButtonColor,
      ),
*/
//        selectedItemColor: AppColors.backgroundColor,
      //      unselectedItemColor: AppColors.backgroundCardColor,
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: Icon(Icons.money),
          label: 'movimentações',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: Icon(Icons.credit_card),
          label: 'limites',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: Icon(Icons.account_balance),
          label: 'balanço',
        ),
      ],
    );
  }
}
