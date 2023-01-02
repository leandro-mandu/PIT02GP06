import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_finance/models/user_model.dart';
import '../src/index/index_page.dart';
import '../utils/app_colors.dart';
import '../utils/shared_preferences_keys.dart';

// ignore: must_be_immutable
class CustomFabButton extends StatelessWidget {
  String text;
  IconData icon;
  Function onPressed;
  CustomFabButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
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
      onPressed: () => onPressed(),
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

// _navigateToNewAccountPage(BuildContext context) async {
//   final user = UserModel(id: 0, nome: "Guest_0", email: "", senha: "");
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString(SharedPreferencesKeys.currentUser, jsonEncode(user));

//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//         builder: (context) => IndexPage(
//               user: user,
//             )),
//   );
// }
