import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText(
      {super.key,
      required this.text,
      this.color = const Color(0xFFccc7c5),
      this.size = 12,
      this.height = 1.2});

  final String text;
  final Color color;
  final double size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
      ),
    );
  }
}
