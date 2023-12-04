// To parse this JSON data, do
//
//     final cartCheckoutResponse = cartCheckoutResponseFromJson(jsonString);

import 'dart:convert';

CartCheckoutResponse cartCheckoutResponseFromJson(String str) => CartCheckoutResponse.fromJson(json.decode(str));

String cartCheckoutResponseToJson(CartCheckoutResponse data) => json.encode(data.toJson());

class CartCheckoutResponse {
  bool? status;
  int? code;
  String? message;
  String? merchantTransactionId;

  CartCheckoutResponse({
    this.status,
    this.code,
    this.message,
    this.merchantTransactionId,
  });

  factory CartCheckoutResponse.fromJson(Map<String, dynamic> json) => CartCheckoutResponse(
    status: json["status"],
    code: json["code"],
    message: json["Message"],
    merchantTransactionId: json["merchantTransactionId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "merchantTransactionId": merchantTransactionId,
  };
}
