import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mail_tracking/core/crud.dart';
import 'package:mail_tracking/core/links.dart';
import 'package:mail_tracking/main.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Crud crud = Crud();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  var name = TextEditingController();
  var password = TextEditingController();
  var email = TextEditingController();

  register() async {
    if (key.currentState!.validate()) {
      try {
        emit(RegisterLoading());

        var response = await crud.postdata(
            {'name': name.text, 'email': email.text, 'password': password.text},
            AppLinks.register);
      

        if (response['status'] == 'success') {
          sharedPref.setInt('id', response['data']['user_id']);

          emit(RegisterSucsess());
        } else {
          emit(RegisterExsitingAccount());
        }
      } catch (e) {
        emit(RegisterFaliuer());
      }
    }
  }
}
