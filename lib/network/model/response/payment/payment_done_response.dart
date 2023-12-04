// To parse this JSON data, do
//
//     final paymentDoneResponse = paymentDoneResponseFromJson(jsonString);

import 'dart:convert';

PaymentDoneResponse paymentDoneResponseFromJson(String str) => PaymentDoneResponse.fromJson(json.decode(str));

String paymentDoneResponseToJson(PaymentDoneResponse data) => json.encode(data.toJson());

class PaymentDoneResponse {
  Payment? payment;

  PaymentDoneResponse({
    this.payment,
  });

  factory PaymentDoneResponse.fromJson(Map<String, dynamic> json) => PaymentDoneResponse(
    payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
  );

  Map<String, dynamic> toJson() => {
    "payment": payment?.toJson(),
  };
}

class Payment {
  String? id;
  String? merchantTransactionId;
  String? type;
  String? operation;
  double? amount;
  String? currency;
  String? status;
  String? description;
  bool? disputes;
  double? applicationFeeAmount;
  String? paymentMethod;
  DateTime? createdDate;
  DateTime? updatedDate;
  List<dynamic>? options;
  dynamic reference;
  List<TransactionEvent>? transactionEvents;

  Payment({
    this.id,
    this.merchantTransactionId,
    this.type,
    this.operation,
    this.amount,
    this.currency,
    this.status,
    this.description,
    this.disputes,
    this.applicationFeeAmount,
    this.paymentMethod,
    this.createdDate,
    this.updatedDate,
    this.options,
    this.reference,
    this.transactionEvents,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    merchantTransactionId: json["merchantTransactionId"],
    type: json["type"],
    operation: json["operation"],
    amount: json["amount"],
    currency: json["currency"],
    status: json["status"],
    description: json["description"],
    disputes: json["disputes"],
    applicationFeeAmount: json["applicationFeeAmount"],
    paymentMethod: json["paymentMethod"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    updatedDate: json["updatedDate"] == null ? null : DateTime.parse(json["updatedDate"]),
    options: json["options"] == null ? [] : List<dynamic>.from(json["options"]!.map((x) => x)),
    reference: json["reference"],
    transactionEvents: json["transactionEvents"] == null ? [] : List<TransactionEvent>.from(json["transactionEvents"]!.map((x) => TransactionEvent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "merchantTransactionId": merchantTransactionId,
    "type": type,
    "operation": operation,
    "amount": amount,
    "currency": currency,
    "status": status,
    "description": description,
    "disputes": disputes,
    "applicationFeeAmount": applicationFeeAmount,
    "paymentMethod": paymentMethod,
    "createdDate": createdDate?.toIso8601String(),
    "updatedDate": updatedDate?.toIso8601String(),
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
    "reference": reference,
    "transactionEvents": transactionEvents == null ? [] : List<dynamic>.from(transactionEvents!.map((x) => x.toJson())),
  };
}

class TransactionEvent {
  String? id;
  String? transactionId;
  String? type;
  dynamic providerTransactionId;
  bool? actionStatus;
  DateTime? createdDate;
  ResponseStatus? responseStatus;

  TransactionEvent({
    this.id,
    this.transactionId,
    this.type,
    this.providerTransactionId,
    this.actionStatus,
    this.createdDate,
    this.responseStatus,
  });

  factory TransactionEvent.fromJson(Map<String, dynamic> json) => TransactionEvent(
    id: json["id"].toString(),
    transactionId: json["transactionId"],
    type: json["type"],
    providerTransactionId: json["providerTransactionId"],
    actionStatus: json["actionStatus"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    responseStatus: json["responseStatus"] == null ? null : ResponseStatus.fromJson(json["responseStatus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionId": transactionId,
    "type": type,
    "providerTransactionId": providerTransactionId,
    "actionStatus": actionStatus,
    "createdDate": createdDate?.toIso8601String(),
    "responseStatus": responseStatus?.toJson(),
  };
}

class ResponseStatus {
  bool? successful;
  int? code;
  String? message;
  String? source;
  SourceDetails? sourceDetails;

  ResponseStatus({
    this.successful,
    this.code,
    this.message,
    this.source,
    this.sourceDetails,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) => ResponseStatus(
    successful: json["successful"],
    code: json["code"],
    message: json["message"],
    source: json["source"],
    sourceDetails: json["sourceDetails"] == null ? null : SourceDetails.fromJson(json["sourceDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "code": code,
    "message": message,
    "source": source,
    "sourceDetails": sourceDetails?.toJson(),
  };
}

class SourceDetails {
  int? attempt;
  String? type;
  String? code;
  dynamic message;

  SourceDetails({
    this.attempt,
    this.type,
    this.code,
    this.message,
  });

  factory SourceDetails.fromJson(Map<String, dynamic> json) => SourceDetails(
    attempt: json["attempt"],
    type: json["type"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "attempt": attempt,
    "type": type,
    "code": code,
    "message": message,
  };
}
