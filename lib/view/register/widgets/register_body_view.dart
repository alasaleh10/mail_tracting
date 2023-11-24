import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_tracking/core/routs.dart';
import 'package:mail_tracking/core/styls.dart';
import 'package:mail_tracking/core/validation.dart';
import 'package:mail_tracking/cuibts/rigester/register_cubit.dart';
import 'package:mail_tracking/view/widgets/custom_elevated_button.dart';
import 'package:mail_tracking/view/widgets/custom_loading.dart';
import 'package:mail_tracking/view/widgets/custom_snackbar.dart';
import 'package:mail_tracking/view/widgets/textformfiled.dart';

class RegisterBodyView extends StatelessWidget {
  const RegisterBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).key,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Register',
                style: Styles.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              controller: BlocProvider.of<RegisterCubit>(context).name,
              validate: (value) {
                return validation('name', value!, 3, 9);
              },
              hintText: 'Name',
              prefxIcon: Icons.near_me,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              controller: BlocProvider.of<RegisterCubit>(context).password,
              validate: (value) {
                return validation('password', value!, 3, 15);
              },
              hintText: 'Password',
              prefxIcon: Icons.lock,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              controller: BlocProvider.of<RegisterCubit>(context).email,
              validate: (value) {
                return validation('email', value!, 3, 25);
              },
              hintText: 'email',
              prefxIcon: Icons.email,
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSucsess) {
                  GoRouter.of(context).pushReplacement(AppRouts.homeScreen);
                } else if (state is RegisterExsitingAccount) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(customSnackBar(title: 'Exiting Account'));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const CustomLoading();
                } else {
                  return CustomElevtedButton(
                      text: 'Register',
                      onPressed: () {
                        BlocProvider.of<RegisterCubit>(context).register();
                      });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
