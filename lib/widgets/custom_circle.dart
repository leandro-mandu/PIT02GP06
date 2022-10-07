import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double size;
  final Color color;
  final Widget? child;
  const CustomCircle({
    Key? key,
    required this.size,
    required this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(child: child),
    );
  }
}
