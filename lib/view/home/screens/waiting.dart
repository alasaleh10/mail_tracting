import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_tracking/core/styls.dart';
import 'package:mail_tracking/cuibts/mails_cuibts/wating_cuibt.dart';
import 'package:mail_tracking/cuibts/mails_stats.dart';
import 'package:mail_tracking/model/mails_molde.dart';
import 'package:mail_tracking/view/home/widgets/custom_mails_items.dart';
import 'package:mail_tracking/view/widgets/custom_loading.dart';

class Waiting extends StatelessWidget {
  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaitingCuibt()..getdata(),
      child: BlocBuilder<WaitingCuibt, MailsCuibtState>(
        builder: (context, state) {
          if (state is MailsStateLoading) {
            return const CustomLoading();
          } else if (state is MailsStateNoData) {
            return const Center(
              child: Text(
                'No data',
                style: Styles.customTextStyle,
              ),
            );
          } else if (state is MailsStateFilure) {
            return const Center(
              child: Text('Worng Try again'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: BlocProvider.of<WaitingCuibt>(context).data.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomMailsItem(
                  malisModel: MalisModel.fromJson(
                      BlocProvider.of<WaitingCuibt>(context).data[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
