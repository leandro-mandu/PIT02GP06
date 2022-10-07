import 'package:flutter/material.dart';

import 'custom_circle.dart';

class MyGoal extends StatelessWidget {
  const MyGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCircle(
      size: 200.0,
      color: Colors.indigo.shade100,
      child: CustomCircle(
        size: 150,
        color: Colors.indigo.shade300,
        child: CustomCircle(
          size: 100,
          color: Colors.indigo.shade600,
          child: CustomCircle(size: 50, color: Colors.indigo.shade800),
        ),
      ),
    );
  }
}
