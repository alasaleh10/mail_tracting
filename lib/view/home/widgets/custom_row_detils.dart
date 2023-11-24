import 'package:flutter/material.dart';
import 'package:mail_tracking/core/styls.dart';

class CustomRowDetils extends StatelessWidget {
  final String titl1;
  final String titl2;

  const CustomRowDetils({super.key, required this.titl1, required this.titl2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$titl1 : ',
          style: Styles.customTextStyle,
          textAlign: TextAlign.start,
        ),
        Text(
          titl2,
          style: Styles.customTextStyle.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
