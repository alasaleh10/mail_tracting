import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_tracking/core/routs.dart';

import 'package:mail_tracking/core/styls.dart';
import 'package:mail_tracking/core/validation.dart';
import 'package:mail_tracking/cuibts/login_cuibt/login_cubit.dart';
import 'package:mail_tracking/view/login/widgets/custom_row_login.dart';
import 'package:mail_tracking/view/widgets/custom_loading.dart';
import 'package:mail_tracking/view/widgets/custom_snackbar.dart';
import 'package:mail_tracking/view/widgets/textformfiled.dart';
import 'package:mail_tracking/view/widgets/custom_elevated_button.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).key,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Login',
                style: Styles.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              controller: BlocProvider.of<LoginCubit>(context).email,
              validate: (value) {
                return validation('email', value!, 3, 25);
              },
              hintText: 'Email',
              prefxIcon: Icons.mail,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              controller: BlocProvider.of<LoginCubit>(context).password,
              validate: (value) {
                return validation('password', value, 8, 15);
              },
              hintText: 'Password',
              prefxIcon: Icons.lock,
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginISucsess) {
                  GoRouter.of(context).pushReplacement(AppRouts.homeScreen);
                } else if (state is LoginIErrorAccount) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(title: 'Worng Email Or password'));
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CustomLoading();
                } else {
                  return CustomElevtedButton(
                      text: 'Login',
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).login();
                      });
                }
              },
            ),
            const CustomRowLogin()
          ],
        ),
      ),
    );
  }
}
