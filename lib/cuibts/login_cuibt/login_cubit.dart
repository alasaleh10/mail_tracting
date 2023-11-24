import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mail_tracking/core/crud.dart';
import 'package:mail_tracking/core/links.dart';
import 'package:mail_tracking/main.dart';

// import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Crud crud = Crud();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  login() async {
   
    if (key.currentState!.validate()) {
      try {
        emit(LoginLoading());
        var response = await crud.getdata(
            '${AppLinks.login}?email=${email.text}&password=${password.text}');
        if (response['status'] == 'success') {
          sharedPref.setInt('id', response['data']['user_id']);
          emit(LoginISucsess());
        } else {
          emit(LoginIErrorAccount());
        }
      } catch (e) {
        emit(LoginFaliure());
      }
    }
  }
}
