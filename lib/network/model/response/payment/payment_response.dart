// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromJson(jsonString);

import 'dart:convert';

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());

class PaymentResponse {
  String? id;
  ResponseStatus? responseStatus;

  PaymentResponse({
    this.id,
    this.responseStatus,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
    id: json["id"],
    responseStatus: json["responseStatus"] == null ? null : ResponseStatus.fromJson(json["responseStatus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "responseStatus": responseStatus?.toJson(),
  };
}

class ResponseStatus {
  bool? successful;
  int? code;
  String? message;
  String? source;
  SourceDetails? sourceDetails;
  dynamic reference;

  ResponseStatus({
    this.successful,
    this.code,
    this.message,
    this.source,
    this.sourceDetails,
    this.reference,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) => ResponseStatus(
    successful: json["successful"],
    code: json["code"],
    message: json["message"],
    source: json["source"],
    sourceDetails: json["sourceDetails"] == null ? null : SourceDetails.fromJson(json["sourceDetails"]),
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "code": code,
    "message": message,
    "source": source,
    "sourceDetails": sourceDetails?.toJson(),
    "reference": reference,
  };
}

class SourceDetails {
  int? attempt;
  String? type;
  String? code;
  String? message;

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
