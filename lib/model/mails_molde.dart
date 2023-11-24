class MalisModel {
  int? mailsId;
  String? mailsShipment;
  String? mailsSender;
  String? mailsRecpint;
  int? mailsStatus;
  String? mailsImage;
  String? mailsDate;
  int? userId;

  MalisModel(
      {this.mailsId,
      this.mailsShipment,
      this.mailsSender,
      this.mailsRecpint,
      this.mailsStatus,
      this.mailsImage,
      this.mailsDate,
      this.userId});

  MalisModel.fromJson(Map<String, dynamic> json) {
    mailsId = json['mails_id'];
    mailsShipment = json['mails_shipment'];
    mailsSender = json['mails_sender'];
    mailsRecpint = json['mails_recpint'];
    mailsStatus = json['mails_status'];
    mailsImage = json['mails_image'];
    mailsDate = json['mails_date'];
    userId = json['user_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['mails_id'] = this.mailsId;
  //   data['mails_shipment'] = this.mailsShipment;
  //   data['mails_sender'] = this.mailsSender;
  //   data['mails_recpint'] = this.mailsRecpint;
  //   data['mails_status'] = this.mailsStatus;
  //   data['mails_image'] = this.mailsImage;
  //   data['mails_date'] = this.mailsDate;
  //   data['user_id'] = this.userId;
  //   return data;
  // }
}