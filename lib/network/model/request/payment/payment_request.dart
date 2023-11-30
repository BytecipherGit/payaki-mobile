// To parse this JSON data, do
//
//     final paymentRequest = paymentRequestFromJson(jsonString);

import 'dart:convert';

PaymentRequest paymentRequestFromJson(String str) => PaymentRequest.fromJson(json.decode(str));

String paymentRequestToJson(PaymentRequest data) => json.encode(data.toJson());

class PaymentRequest {
  String? amount;
  String? currency;
  String? description;
  String? merchantTransactionId;
  String? paymentMethod;
  PaymentInfo? paymentInfo;
  Notify? notify;

  PaymentRequest({
    this.amount,
    this.currency,
    this.description,
    this.merchantTransactionId,
    this.paymentMethod,
    this.paymentInfo,
    this.notify,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
    amount: json["amount"],
    currency: json["currency"],
    description: json["description"],
    merchantTransactionId: json["merchantTransactionId"],
    paymentMethod: json["paymentMethod"],
    paymentInfo: json["paymentInfo"] == null ? null : PaymentInfo.fromJson(json["paymentInfo"]),
    notify: json["notify"] == null ? null : Notify.fromJson(json["notify"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
    "description": description,
    "merchantTransactionId": merchantTransactionId,
    "paymentMethod": paymentMethod,
    "paymentInfo": paymentInfo?.toJson(),
    "notify": notify?.toJson(),
  };
}

class Notify {
  String? name;
  String? telephone;
  String? email;

  Notify({
    this.name,
    this.telephone,
    this.email,
  });

  factory Notify.fromJson(Map<String, dynamic> json) => Notify(
    name: json["name"],
    telephone: json["telephone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "telephone": telephone,
    "email": email,
  };
}

class PaymentInfo {
  String? phoneNumber;

  PaymentInfo({
    this.phoneNumber,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
  };
}
