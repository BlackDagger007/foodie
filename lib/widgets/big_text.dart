import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  final String text;
  final Color color;
  final double size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ),
    );
  }
}