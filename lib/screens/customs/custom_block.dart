import 'package:flutter/material.dart';
import 'package:testbloc/screens/customs/custom_text.dart';

class CustomBlock extends StatelessWidget {
  final String image;
  final String titlel;
  final String subTitlel;
  const CustomBlock({
    super.key,
    required this.image,
    required this.titlel,
    required this.subTitlel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, width: 60),
        Column(
          children: [
            CustomText(text: subTitlel, fontWeight: FontWeight.normal),
            CustomText(text: titlel),
          ],
        ),
      ],
    );
  }
}
