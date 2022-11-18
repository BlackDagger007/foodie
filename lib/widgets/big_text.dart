import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BigText extends StatelessWidget {
  const BigText(
    this.text, {
    this.color = const Color(0xFF332d2b),
    this.size,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  final String? text;
  final Color color;
  final double? size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size ?? sH(20),
        color: color,
      ),
    );
  }
}
