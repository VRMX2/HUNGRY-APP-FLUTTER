import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color
      )
    );
  }
}
