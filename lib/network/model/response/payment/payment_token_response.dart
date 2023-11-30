import 'dart:convert';
PaymentTokenResponse paymentTokenResponseFromJson(String str) => PaymentTokenResponse.fromJson(json.decode(str));

String paymentTokenResponseToJson(PaymentTokenResponse data) => json.encode(data.toJson());

class PaymentTokenResponse {
  String? tokenType;
  String? expiresIn;
  String? extExpiresIn;
  String? expiresOn;
  String? notBefore;
  String? resource;
  String? accessToken;

  PaymentTokenResponse({
    this.tokenType,
    this.expiresIn,
    this.extExpiresIn,
    this.expiresOn,
    this.notBefore,
    this.resource,
    this.accessToken,
  });

  factory PaymentTokenResponse.fromJson(Map<String, dynamic> json) => PaymentTokenResponse(
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    extExpiresIn: json["ext_expires_in"],
    expiresOn: json["expires_on"],
    notBefore: json["not_before"],
    resource: json["resource"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "token_type": tokenType,
    "expires_in": expiresIn,
    "ext_expires_in": extExpiresIn,
    "expires_on": expiresOn,
    "not_before": notBefore,
    "resource": resource,
    "access_token": accessToken,
  };
}
