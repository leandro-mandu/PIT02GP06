import 'package:flutter/material.dart';

class AddTicker extends StatefulWidget {
  const AddTicker({Key? key}) : super(key: key);

  @override
  State<AddTicker> createState() => _AddTickerState();
}

class _AddTickerState extends State<AddTicker> {
  final _formAddTickerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo Ativo")),
      body: Form(
        key: _formAddTickerKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Ticker da empresa",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
