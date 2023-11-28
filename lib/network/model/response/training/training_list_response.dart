// To parse this JSON data, do
//
//     final trainingListResponse = trainingListResponseFromJson(jsonString);

import 'dart:convert';

TrainingListResponse trainingListResponseFromJson(String str) => TrainingListResponse.fromJson(json.decode(str));

String trainingListResponseToJson(TrainingListResponse data) => json.encode(data.toJson());

class TrainingListResponse {
  bool? status;
  int? code;
  String? message;
  List<Datum>? data;

  TrainingListResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory TrainingListResponse.fromJson(Map<String, dynamic> json) => TrainingListResponse(
    status: json["status"],
    code: json["code"],
    message: json["Message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? status;
  String? userId;
  String? featured;
  String? urgent;
  String? highlight;
  String? sellerName;
  String? productName;
  String? slug;
  String? description;
  String? category;
  String? subCategory;
  String? postType;
  DateTime? eventDate;
  String? eventTime;
  String? price;
  String? negotiable;
  String? phone;
  String? hidePhone;
  String? location;
  String? city;
  String? state;
  String? country;
  String? latlong;
  String? screenShot;
  String? promoVideo;
  String? tag;
  String? view;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? expireDays;
  DateTime? expiredDate;
  String? isVerified;
  String? expireDate;
  dynamic featuredExpDate;
  dynamic urgentExpDate;
  dynamic highlightExpDate;
  String? adminSeen;
  String? emailed;
  String? hide;
  String? postUserName;
  String? catName;
  String? subCatName;
  String? cityName;
  String? stateName;
  String? countryName;
  String? fullAddress;
  bool? isPurchased;
  List<String>? image;
  List<Gallery>? gallery;

  Datum({
    this.id,
    this.status,
    this.userId,
    this.featured,
    this.urgent,
    this.highlight,
    this.sellerName,
    this.productName,
    this.slug,
    this.description,
    this.category,
    this.subCategory,
    this.postType,
    this.eventDate,
    this.eventTime,
    this.price,
    this.negotiable,
    this.phone,
    this.hidePhone,
    this.location,
    this.city,
    this.state,
    this.country,
    this.latlong,
    this.screenShot,
    this.promoVideo,
    this.tag,
    this.view,
    this.createdAt,
    this.updatedAt,
    this.expireDays,
    this.expiredDate,
    this.isVerified,
    this.expireDate,
    this.featuredExpDate,
    this.urgentExpDate,
    this.highlightExpDate,
    this.adminSeen,
    this.emailed,
    this.hide,
    this.postUserName,
    this.catName,
    this.subCatName,
    this.cityName,
    this.stateName,
    this.countryName,
    this.fullAddress,
    this.isPurchased,
    this.image,
    this.gallery,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    status: json["status"],
    userId: json["user_id"],
    featured: json["featured"],
    urgent: json["urgent"],
    highlight: json["highlight"],
    sellerName: json["seller_name"],
    productName: json["product_name"],
    slug: json["slug"],
    description: json["description"],
    category: json["category"],
    subCategory: json["sub_category"],
    postType: json["post_type"],
    eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
    eventTime: json["event_time"],
    price: json["price"],
    negotiable: json["negotiable"],
    phone: json["phone"],
    hidePhone: json["hide_phone"],
    location: json["location"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    latlong: json["latlong"],
    screenShot: json["screen_shot"],
    promoVideo: json["promo_video"],
    tag: json["tag"],
    view: json["view"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    expireDays: json["expire_days"],
    expiredDate: json["expired_date"] == null ? null : DateTime.parse(json["expired_date"]),
    isVerified: json["is_verified"],
    expireDate: json["expire_date"],
    featuredExpDate: json["featured_exp_date"],
    urgentExpDate: json["urgent_exp_date"],
    highlightExpDate: json["highlight_exp_date"],
    adminSeen: json["admin_seen"],
    emailed: json["emailed"],
    hide: json["hide"],
    postUserName: json["post_user_name"],
    catName: json["cat_name"],
    subCatName: json["sub_cat_name"],
    cityName: json["city_name"],
    stateName: json["state_name"],
    countryName: json["country_name"],
    fullAddress: json["full_address"],
    isPurchased: json["is_purchased"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    gallery: json["gallery"] == null ? [] : List<Gallery>.from(json["gallery"]!.map((x) => Gallery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "user_id": userId,
    "featured": featured,
    "urgent": urgent,
    "highlight": highlight,
    "seller_name": sellerName,
    "product_name": productName,
    "slug": slug,
    "description": description,
    "category": category,
    "sub_category": subCategory,
    "post_type": postType,
    "event_date": "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
    "event_time": eventTime,
    "price": price,
    "negotiable": negotiable,
    "phone": phone,
    "hide_phone": hidePhone,
    "location": location,
    "city": city,
    "state": state,
    "country": country,
    "latlong": latlong,
    "screen_shot": screenShot,
    "promo_video": promoVideo,
    "tag": tag,
    "view": view,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "expire_days": expireDays,
    "expired_date": expiredDate?.toIso8601String(),
    "is_verified": isVerified,
    "expire_date": expireDate,
    "featured_exp_date": featuredExpDate,
    "urgent_exp_date": urgentExpDate,
    "highlight_exp_date": highlightExpDate,
    "admin_seen": adminSeen,
    "emailed": emailed,
    "hide": hide,
    "post_user_name": postUserName,
    "cat_name": catName,
    "sub_cat_name": subCatName,
    "city_name": cityName,
    "state_name": stateName,
    "country_name": countryName,
    "full_address": fullAddress,
    "is_purchased": isPurchased,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x.toJson())),
  };
}

class Gallery {
  String? id;
  String? productId;
  String? trainingVideo;

  Gallery({
    this.id,
    this.productId,
    this.trainingVideo,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"],
    productId: json["product_id"],
    trainingVideo: json["training_video"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "training_video": trainingVideo,
  };
}
