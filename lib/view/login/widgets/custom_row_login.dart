import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_tracking/core/routs.dart';
import 'package:mail_tracking/core/styls.dart';

class CustomRowLogin extends StatelessWidget {
  const CustomRowLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have account?',
          style: Styles.customTextStyle,
        ),
        TextButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouts.register);
            },
            child: Text(
              'Register Now!',
              style: Styles.customTextStyle.copyWith(color: Colors.blue),
            ))
      ],
    );
  }
}
