import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  const CustomText({
    super.key,
    required this.text,
     this.color,
     this.size,
     this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 18,
        fontWeight:
        fontWeight ?? 
        FontWeight.bold,
      ),
    );
  }
}
