import 'package:flutter/material.dart';
import 'package:mail_tracking/core/styls.dart';

class CustomElevtedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevtedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2,
                vertical: 10),
            backgroundColor: Colors.white),
        child: Text(
          text,
          style: Styles.buttonStyle,
        ));
  }
}
