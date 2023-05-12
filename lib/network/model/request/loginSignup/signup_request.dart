// class SignUpRequest {
//   String? name;
//   Param? param;
//
//   SignUpRequest({this.name, this.param});
//
//   SignUpRequest.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     param = json['param'] != null ? new Param.fromJson(json['param']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.param != null) {
//       data['param'] = this.param!.toJson();
//     }
//     return data;
//   }
// }

import 'package:dio/dio.dart';

class SignUpRequest {
  String? name;
  String? fullName;
  String? userName;
  String? email;
  String? phone;
  String? countryCode;
  String? pass;
  String? idProofType;
  String? idProofNumber;
  MultipartFile? idProof;
  String? addressProofType;
  String? addressProofNumber;
  MultipartFile? addressProof;

  SignUpRequest({this.name,this.fullName, this.userName, this.email, this.phone,this.countryCode,
    this.pass,
    this.idProofType,
    this.idProofNumber,
    this.idProof,
    this.addressProofType,
    this.addressProofNumber,
    this.addressProof});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    pass = json['pass'];
    idProofType = json['id_proof_type'];
    idProofNumber = json['id_proof_number'];
    idProof = json['id_proof'];
    addressProofType = json['address_proof_type'];
    addressProofNumber = json['address_proof_number'];
    addressProof = json['address_proof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['pass'] = this.pass;
    data['id_proof_type'] = this.idProofType;
    data['id_proof_number'] = this.idProofNumber;
    data['id_proof'] = this.idProof;
    data['address_proof_type'] = this.addressProofType;
    data['address_proof_number'] = this.addressProofNumber;
    data['address_proof'] = this.addressProof;
    return data;
  }
}
