import 'package:flutter/material.dart';
import 'package:mail_tracking/core/consts.dart';


class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?) ? validate;
  final String hintText;
  final IconData prefxIcon;

  const CustomTextFormFiled(
      {super.key,
      required this.prefxIcon,
      required this.hintText,
 
      
       this.validate, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: controller,
      validator:validate,
      cursorColor: Colors.black,
      cursorHeight: 20,
   
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 18),
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
        errorStyle: const TextStyle(color: Colors.white)
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(.7)),
    );
  }
}
