class LoginWithPhoneSendOtpRequest {
  String? name;
  Param? param;

  LoginWithPhoneSendOtpRequest({this.name, this.param});

  LoginWithPhoneSendOtpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class Param {
  String? phone;
  String? countryCode;

  Param({this.phone, this.countryCode});

  Param.fromJson(Map<String, dynamic> json) {
    phone = json['mobile'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    return data;
  }
}
