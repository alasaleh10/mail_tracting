import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_tracking/cuibts/login_cuibt/login_cubit.dart';
import 'package:mail_tracking/view/login/widgets/login_body_view.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mail tracting',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const LoginBodyView(),
      ),
    );
  }
}
