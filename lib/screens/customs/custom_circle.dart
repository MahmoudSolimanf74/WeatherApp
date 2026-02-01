import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double start;
  final double end;
  final Color color;
  final double? width;
  const CustomCircle({
    super.key,
    required this.start,
    required this.end,
    required this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(start, end),
      child: Container(
        width: width ?? 300,
        height: width ?? 300,
        decoration: BoxDecoration(shape: .circle, color: color),
      ),
    );
  }
}
