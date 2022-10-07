import 'package:flutter/material.dart';

class Candle extends StatelessWidget {
  final double open;
  final double close;
  final double min;
  final double max;
  const Candle({
    super.key,
    required this.open,
    required this.min,
    required this.max,
    required this.close,
  });
  @override
  Widget build(BuildContext context) {
    if (open < close) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: max - close,
              width: 1,
            ),
            Container(
              color: Colors.green,
              height: close - open,
              width: 20,
            ),
            Container(
              color: Colors.black,
              height: open - min,
              width: 1,
            )
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: max - open,
            width: 1,
          ),
          Container(
            color: Colors.red,
            height: open - close,
            width: 20,
          ),
          Container(
            color: Colors.black,
            height: close - min,
            width: 1,
          ),
        ],
      ),
    );
  }
}
