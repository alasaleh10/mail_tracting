import 'package:flutter/material.dart';
import 'package:mail_tracking/core/consts.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validate;
  final String hintText;
  final IconData prefxIcon;

  const CustomTextFormFiled(
      {super.key,
      required this.prefxIcon,
      required this.hintText,
      this.validate,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        autocorrect: false,
        controller: controller,
        validator: validate,
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 18, color: Colors.white),
            filled: true,
            fillColor: kPrimColor,
            prefixIcon: Icon(
              prefxIcon,
              size: 30,
              color: Colors.black.withOpacity(.7),
            ),
            enabledBorder: outlineBorder(),
            focusedBorder: outlineBorder(),
            errorBorder: outlineBorder(),
            errorStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(.7)),
    );
  }
}
