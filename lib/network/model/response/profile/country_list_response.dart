class CountryListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  CountryListResponse({this.status, this.code, this.message, this.data});

  CountryListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? code;
  var latitude;
  var longitude;
  String? iso3;
  String? isoNumeric;
  String? fips;
  String? name;
  String? asciiname;
  String? capital;
  String? area;
  String? population;
  String? continentCode;
  String? tld;
  String? currencyCode;
  String? phone;
  String? postalCodeFormat;
  String? postalCodeRegex;
  String? languages;
  String? neighbours;
  String? equivalentFipsCode;
  String? active;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.code,
        this.latitude,
        this.longitude,
        this.iso3,
        this.isoNumeric,
        this.fips,
        this.name,
        this.asciiname,
        this.capital,
        this.area,
        this.population,
        this.continentCode,
        this.tld,
        this.currencyCode,
        this.phone,
        this.postalCodeFormat,
        this.postalCodeRegex,
        this.languages,
        this.neighbours,
        this.equivalentFipsCode,
        this.active,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    iso3 = json['iso3'];
    isoNumeric = json['iso_numeric'];
    fips = json['fips'];
    name = json['name'];
    asciiname = json['asciiname'];
    capital = json['capital'];
    area = json['area'];
    population = json['population'];
    continentCode = json['continent_code'];
    tld = json['tld'];
    currencyCode = json['currency_code'];
    phone = json['phone'];
    postalCodeFormat = json['postal_code_format'];
    postalCodeRegex = json['postal_code_regex'];
    languages = json['languages'];
    neighbours = json['neighbours'];
    equivalentFipsCode = json['equivalent_fips_code'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['iso3'] = this.iso3;
    data['iso_numeric'] = this.isoNumeric;
    data['fips'] = this.fips;
    data['name'] = this.name;
    data['asciiname'] = this.asciiname;
    data['capital'] = this.capital;
    data['area'] = this.area;
    data['population'] = this.population;
    data['continent_code'] = this.continentCode;
    data['tld'] = this.tld;
    data['currency_code'] = this.currencyCode;
    data['phone'] = this.phone;
    data['postal_code_format'] = this.postalCodeFormat;
    data['postal_code_regex'] = this.postalCodeRegex;
    data['languages'] = this.languages;
    data['neighbours'] = this.neighbours;
    data['equivalent_fips_code'] = this.equivalentFipsCode;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
