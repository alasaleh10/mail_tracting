import 'package:bloc/bloc.dart';
import 'package:mail_tracking/core/crud.dart';
import 'package:mail_tracking/model/mails_molde.dart';

import '../../../core/links.dart';
import '../../mails_stats.dart';


class SearchMailCubit extends Cubit<MailsCuibtState> {
  SearchMailCubit() : super(MailsStateInitial());
  Crud crud=Crud();
MalisModel? malisModel;
  void searchMail(String mail)async
  {
 try {
      emit(MailsStateLoading());

      var response =
          await crud.getdata('${AppLinks.searchMail}?mail=$mail');
      if (response['status'] == 'success') {
        malisModel=MalisModel.fromJson(response['data']);
       
        emit(MailsStateSucsess());
      } else {
        emit(MailsStateNoData());
      }
    } catch (e) {
      emit(MailsStateFilure());
    }
  }
}
