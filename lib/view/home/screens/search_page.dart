import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_tracking/cuibts/mails_cuibts/searchmail/search_mail_cubit.dart';
import 'package:mail_tracking/cuibts/mails_stats.dart';
import 'package:mail_tracking/view/widgets/textformfiled.dart';

import '../../../core/links.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMailCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            BlocBuilder<SearchMailCubit, MailsCuibtState>(
              builder: (context, state) {
                return CustomTextFormFiled(
                    onChanged: (val) {
                      BlocProvider.of<SearchMailCubit>(context).searchMail(val);
                    },
                    prefxIcon: Icons.search,
                    hintText: 'Search');
              },
            ),
            const SizedBox(height: 50),
            BlocBuilder<SearchMailCubit, MailsCuibtState>(
              builder: (context, state) {
                final cuibt = BlocProvider.of<SearchMailCubit>(context);

                if (state is MailsStateNoData) {
                  return const Text(
                    'No Mail',
                    style: TextStyle(color: Colors.white),
                  );
                } else if (state is MailsStateSucsess) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              '${AppLinks.upload}/${cuibt.malisModel!.mailsImage}'),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            DefaultTextStyle(
                              style: TextStyle(color: Colors.white),
                              child: Row(
                                children: [
                                  Text('Mail No.'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(cuibt.malisModel!.mailsNo!)
                                ],
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(color: Colors.white),
                              child: Row(
                                children: [
                                  Text('Mail Status'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(status(cuibt.malisModel!.mailsStatus!))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

String status(int stat) {
  if (stat == 0) {
    return 'wating';
  } else if (stat == 1) {
    return 'done';
  } else {
    return 'faild';
  }
}
