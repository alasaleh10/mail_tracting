import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_tracking/core/routs.dart';
import 'package:mail_tracking/cuibts/rigester/register_cubit.dart';
import 'package:mail_tracking/view/register/widgets/register_body_view.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: WillPopScope(
        onWillPop: () {
          GoRouter.of(context).pushReplacement(AppRouts.login);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouts.login);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text(
              'Mail tracting',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const RegisterBodyView(),
        ),
      ),
    );
  }
}
