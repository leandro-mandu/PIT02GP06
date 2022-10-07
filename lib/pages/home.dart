import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:u_finance/pages/add_ticker.dart';
import 'package:u_finance/widgets/candle.dart';

import '../widgets/my_goal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Finance")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: 20,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Candle(open: 130, min: 80, max: 150, close: 100),
                Candle(open: 100, min: 20, max: 110, close: 50),
                Candle(open: 50, min: 10, max: 90, close: 80),
                Candle(open: 80, min: 70, max: 120, close: 100),
              ],
            ),
            const MyGoal(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("Abrindo tela de cadastro");
          _navigateToAdd(context);
        },
        tooltip: "Acrescentar ativo",
        elevation: 10,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade900,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Username"),
              accountEmail: Text("user@mail.com"),
            ),
            const ListTile(
              title: Text("Username2"),
              subtitle: Text("user2@mail.com"),
              textColor: Colors.grey,
            ),
            const ListTile(
              title: Text("Username3"),
              subtitle: Text("user3@mail.com"),
              textColor: Colors.grey,
            ),
            const Divider(color: Colors.white),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddTicker(),
                  ),
                );
              },
              child: const Text("Adicionar conta"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Saldo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: "Operações",
          ),
        ],
      ),
    );
  }

  _navigateToAdd(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddTicker()),
    );
  }
}
