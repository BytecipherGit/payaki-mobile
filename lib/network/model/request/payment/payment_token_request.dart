import 'dart:convert';

PaymentTokenRequest paymentTokenRequestFromJson(String str) =>
    PaymentTokenRequest.fromJson(json.decode(str));

String paymentTokenRequestToJson(PaymentTokenRequest data) =>
    json.encode(data.toJson());

class PaymentTokenRequest {
  String? grantType;
  String? clientId;
  String? clientSecret;
  String? resource;

  PaymentTokenRequest({
    this.grantType,
    this.clientId,
    this.clientSecret,
    this.resource,
  });

  factory PaymentTokenRequest.fromJson(Map<String, dynamic> json) =>
      PaymentTokenRequest(
        grantType: json["grant_type"],
        clientId: json["client_id"],
        clientSecret: json["client_secret"],
        resource: json["resource"],
      );

  Map<String, dynamic> toJson() => {
        "grant_type": grantType,
        "client_id": clientId,
        "client_secret": clientSecret,
        "resource": resource,
      };
}
