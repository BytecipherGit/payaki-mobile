class SignUpRequest {
  String? name;
  Param? param;

  SignUpRequest({this.name, this.param});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? userName;
  String? email;
  String? phone;
  String? countryCode;
  String? pass;

  Param({this.fullName, this.userName, this.email, this.phone,this.countryCode, this.pass});

  Param.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['pass'] = this.pass;
    return data;
  }
}
