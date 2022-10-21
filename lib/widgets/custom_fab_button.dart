import 'package:flutter/material.dart';
import 'package:u_finance/pages/create_account.dart';
import 'package:u_finance/src/home/home_page.dart';

import '../pages/home.dart';
import '../src/home/index_page.dart';
import '../utils/app_colors.dart';

class CustomFabButton extends StatelessWidget {
  String text;
  IconData icon;
  CustomFabButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 25),
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        backgroundColor: AppColors.backgroundButtonColor,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(80, 80))),
      ),
      onPressed: () {
        _navigateToNewAccountPage(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

_navigateToNewAccountPage(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const IndexPage()),
  );
}
