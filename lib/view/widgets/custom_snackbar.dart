import 'package:flutter/material.dart';
import 'package:mail_tracking/core/styls.dart';

customSnackBar({required String title}) {
  return  SnackBar(
    content: Text(
     title,
      style: Styles.customTextStyle,
    ),
  );
}
