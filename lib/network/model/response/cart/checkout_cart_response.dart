
import 'dart:convert';

CartCheckoutResponse cartCheckoutResponseFromJson(String str) => CartCheckoutResponse.fromJson(json.decode(str));

String cartCheckoutResponseToJson(CartCheckoutResponse data) => json.encode(data.toJson());

class CartCheckoutResponse {
  bool status;
  int code;
  String message;
  String merchantTransactionId;
  dynamic transactionId;
  dynamic success;
  String accessToken;
  // String orderId;

  CartCheckoutResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.merchantTransactionId,
    required this.transactionId,
    required this.success,
    required this.accessToken,
    // required this.orderId,
  });

  factory CartCheckoutResponse.fromJson(Map<String, dynamic> json) => CartCheckoutResponse(
    status: json["status"],
    code: json["code"],
    message: json["Message"],
    merchantTransactionId: json["merchantTransactionId"],
    transactionId: json["transactionId"],
    success: json["success"],
    accessToken: json["accessToken"],
    // orderId: json["orderId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "merchantTransactionId": merchantTransactionId,
    "transactionId": transactionId,
    "success": success,
    "accessToken": accessToken,
    // "orderId": orderId,
  };
}
