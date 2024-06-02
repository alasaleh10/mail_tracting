import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_tracking/core/crud.dart';
import 'package:mail_tracking/core/links.dart';
import 'package:mail_tracking/cuibts/mails_stats.dart';
import 'package:mail_tracking/main.dart';

class WaitingCuibt extends Cubit<MailsCuibtState> {
  WaitingCuibt() : super(MailsStateInitial());
  Crud crud = Crud();
  List data = [];
  getdata() async {
    try {
      emit(MailsStateLoading());

      var response = await crud
          .getdata('${AppLinks.waiting}?id=${sharedPref.getInt('id')}');
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        emit(MailsStateSucsess());
      } else {
        emit(MailsStateNoData());
      }
    } catch (e) {
      emit(MailsStateFilure());
    }
  }
}
