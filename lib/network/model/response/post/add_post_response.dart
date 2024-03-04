// To parse this JSON data, do
//
//     final addPostResponse = addPostResponseFromJson(jsonString);

import 'dart:convert';

AddPostResponse addPostResponseFromJson(String str) => AddPostResponse.fromJson(json.decode(str));

String addPostResponseToJson(AddPostResponse data) => json.encode(data.toJson());

class AddPostResponse {
  bool status;
  String code;
  String message;
  Data data;
  String pramotionType;
  String merchantTransactionId;
  String amount;

  AddPostResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
    required this.pramotionType,
    required this.merchantTransactionId,
    required this.amount,
  });

  factory AddPostResponse.fromJson(Map<String, dynamic> json) => AddPostResponse(
    status: json["status"],
    code: json["code"].toString(),
    message: json["Message"].toString(),
    data: Data.fromJson(json["data"]),
    pramotionType: json["pramotion_type"].toString(),
    merchantTransactionId: json["merchantTransactionId"].toString(),
    amount: json["amount"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "data": data.toJson(),
    "pramotion_type": pramotionType,
    "merchantTransactionId": merchantTransactionId,
    "amount": amount,
  };
}

class Data {
  String id;
//   String status;
//   String userId;
//   String featured;
//   String urgent;
//   String highlight;
//   String sellerName;
  String productName;
//   String slug;
//   String description;
//   String category;
//   String subCategory;
//   String postType;
//   dynamic eventDate;
//   dynamic eventTime;
//   String price;
//   String negotiable;
//   String phone;
//   String hidePhone;
//   String location;
//   String city;
//   String state;
//   String country;
//   String latlong;
//   String screenShot;
//   String promoVideo;
//   String tag;
//   String view;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int expireDays;
//   DateTime expiredDate;
//   String isVerified;
//   String expireDate;
//   dynamic featuredExpDate;
//   dynamic urgentExpDate;
//   dynamic highlightExpDate;
//   String adminSeen;
//   String ema;
//
  Data({
    required this.id,
//     required this.status,
//     required this.userId,
//     required this.featured,
//     required this.urgent,
//     required this.highlight,
//     required this.sellerName,
    required this.productName,
//     required this.slug,
//     required this.description,
//     required this.category,
//     required this.subCategory,
//     required this.postType,
//     required this.eventDate,
//     required this.eventTime,
//     required this.price,
//     required this.negotiable,
//     required this.phone,
//     required this.hidePhone,
//     required this.location,
//     required this.city,
//     required this.state,
//     required this.country,
//     required this.latlong,
//     required this.screenShot,
//     required this.promoVideo,
//     required this.tag,
//     required this.view,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.expireDays,
//     required this.expiredDate,
//     required this.isVerified,
//     required this.expireDate,
//     required this.featuredExpDate,
//     required this.urgentExpDate,
//     required this.highlightExpDate,
//     required this.adminSeen,
//     required this.ema,
  });
//
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"].toString(),
//     status: json["status"],
//     userId: json["user_id"],
//     featured: json["featured"],
//     urgent: json["urgent"],
//     highlight: json["highlight"],
//     sellerName: json["seller_name"],
    productName: json["product_name"],
//     slug: json["slug"],
//     description: json["description"],
//     category: json["category"],
//     subCategory: json["sub_category"],
//     postType: json["post_type"],
//     eventDate: json["event_date"],
//     eventTime: json["event_time"],
//     price: json["price"],
//     negotiable: json["negotiable"],
//     phone: json["phone"],
//     hidePhone: json["hide_phone"],
//     location: json["location"],
//     city: json["city"],
//     state: json["state"],
//     country: json["country"],
//     latlong: json["latlong"],
//     screenShot: json["screen_shot"],
//     promoVideo: json["promo_video"],
//     tag: json["tag"],
//     view: json["view"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     expireDays: json["expire_days"],
//     expiredDate: DateTime.parse(json["expired_date"]),
//     isVerified: json["is_verified"],
//     expireDate: json["expire_date"],
//     featuredExpDate: json["featured_exp_date"],
//     urgentExpDate: json["urgent_exp_date"],
//     highlightExpDate: json["highlight_exp_date"],
//     adminSeen: json["admin_seen"],
//     ema: json["ema"],
  );
//
  Map<String, dynamic> toJson() => {
    "id": id,
//     "status": status,
//     "user_id": userId,
//     "featured": featured,
//     "urgent": urgent,
//     "highlight": highlight,
//     "seller_name": sellerName,
    "product_name": productName,
//     "slug": slug,
//     "description": description,
//     "category": category,
//     "sub_category": subCategory,
//     "post_type": postType,
//     "event_date": eventDate,
//     "event_time": eventTime,
//     "price": price,
//     "negotiable": negotiable,
//     "phone": phone,
//     "hide_phone": hidePhone,
//     "location": location,
//     "city": city,
//     "state": state,
//     "country": country,
//     "latlong": latlong,
//     "screen_shot": screenShot,
//     "promo_video": promoVideo,
//     "tag": tag,
//     "view": view,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "expire_days": expireDays,
//     "expired_date": expiredDate.toIso8601String(),
//     "is_verified": isVerified,
//     "expire_date": expireDate,
//     "featured_exp_date": featuredExpDate,
//     "urgent_exp_date": urgentExpDate,
//     "highlight_exp_date": highlightExpDate,
//     "admin_seen": adminSeen,
//     "ema": ema,
  };
}
