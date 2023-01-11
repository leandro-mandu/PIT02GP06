import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class HomeBottomNavBar extends StatefulWidget {
  PageController pageController;
  HomeBottomNavBar({Key? key, required this.pageController}) : super(key: key);

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      onTap: (value) {
        setState(() {
          current = value;
          widget.pageController.animateToPage(
            current,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      },
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
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: const Icon(Icons.money),
          label: 'Transações',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: const Icon(Icons.credit_card),
          label: 'Balanço',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          icon: const Icon(Icons.wallet),
          label: 'Carteira',
        ),
      ],
    );
  }
}
