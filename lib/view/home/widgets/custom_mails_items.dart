import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mail_tracking/core/links.dart';

import 'package:mail_tracking/model/mails_molde.dart';

import 'package:mail_tracking/view/home/widgets/custom_row_detils.dart';

class CustomMailsItem extends StatelessWidget {
  final MalisModel malisModel;
  const CustomMailsItem({
    super.key,
    required this.malisModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(children: [
        CircleAvatar(
          backgroundImage:
              NetworkImage('${AppLinks.upload}/${malisModel.mailsImage}'),
          radius: 45,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            CustomRowDetils(
                titl1: 'Shipment', titl2: malisModel.mailsShipment!),
            const SizedBox(
              height: 3,
            ),
            CustomRowDetils(
                titl1: 'Sender Name', titl2: malisModel.mailsSender!),
            const SizedBox(
              height: 3,
            ),
            CustomRowDetils(
                titl1: 'Recipient Name', titl2: malisModel.mailsRecpint!),
            const SizedBox(
              height: 3,
            ),
            CustomRowDetils(
                titl1: 'Date',
                titl2: DateFormat('yyyy/MM/dd - hh:mm')
                    .format(DateTime.parse(malisModel.mailsDate!))
                    .toString()),
          ],
        )
      ]),
    );
  }
}
