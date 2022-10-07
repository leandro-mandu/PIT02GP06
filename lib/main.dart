import 'package:flutter/material.dart';
import 'package:u_finance/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U Finance',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Welcome(),
    );
  }
}
