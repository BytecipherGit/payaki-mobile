import 'dart:convert';

PaymentStatusApiRequest paymentStatusApiRequestFromJson(String str) => PaymentStatusApiRequest.fromJson(json.decode(str));

String paymentStatusApiRequestToJson(PaymentStatusApiRequest data) => json.encode(data.toJson());

class PaymentStatusApiRequest {
  String name;
  Parameter param;

  PaymentStatusApiRequest({
    required this.name,
    required this.param,
  });

  factory PaymentStatusApiRequest.fromJson(Map<String, dynamic> json) => PaymentStatusApiRequest(
    name: json["name"],
    param: Parameter.fromJson(json["param"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "param": param.toJson(),
  };
}

class Parameter {
  String transactionId;
  String merchantTransactionId;
  String accessToken;
  String orderId;

  Parameter({
    required this.transactionId,
    required this.merchantTransactionId,
    required this.accessToken,
    required this.orderId,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
    transactionId: json["transactionId"],
    merchantTransactionId: json["merchantTransactionId"],
    accessToken: json["accessToken"],
    orderId: json["orderId"],
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
    "merchantTransactionId": merchantTransactionId,
    "accessToken": accessToken,
    "orderId": orderId,
  };
}
