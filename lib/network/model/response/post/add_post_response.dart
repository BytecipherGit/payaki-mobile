class AddPostResponse {
  bool? status;
  int? code;
  String? message;
  Data? data;

  AddPostResponse({this.status, this.code, this.message, this.data});

  AddPostResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  String? createdAt;
  String? updatedAt;
  String? expireDays;
  String? expiredDate;
  String? isVerified;
  String? expireDate;
  String? adminSeen;
  String? emailed;
  String? hide;

  Data(
      {this.id,
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
        this.adminSeen,
        this.emailed,
        this.hide});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    featured = json['featured'];
    urgent = json['urgent'];
    highlight = json['highlight'];
    sellerName = json['seller_name'];
    productName = json['product_name'];
    slug = json['slug'];
    description = json['description'];
    category = json['category'];
    subCategory = json['sub_category'];
    postType = json['post_type'];
    price = json['price'];
    negotiable = json['negotiable'];
    phone = json['phone'];
    hidePhone = json['hide_phone'];
    location = json['location'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latlong = json['latlong'];
    screenShot = json['screen_shot'];
    promoVideo = json['promo_video'];
    tag = json['tag'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expireDays = json['expire_days'];
    expiredDate = json['expired_date'];
    isVerified = json['is_verified'];
    expireDate = json['expire_date'];
    adminSeen = json['admin_seen'];
    emailed = json['emailed'];
    hide = json['hide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['featured'] = this.featured;
    data['urgent'] = this.urgent;
    data['highlight'] = this.highlight;
    data['seller_name'] = this.sellerName;
    data['product_name'] = this.productName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['post_type'] = this.postType;
    data['price'] = this.price;
    data['negotiable'] = this.negotiable;
    data['phone'] = this.phone;
    data['hide_phone'] = this.hidePhone;
    data['location'] = this.location;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latlong'] = this.latlong;
    data['screen_shot'] = this.screenShot;
    data['promo_video'] = this.promoVideo;
    data['tag'] = this.tag;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expire_days'] = this.expireDays;
    data['expired_date'] = this.expiredDate;
    data['is_verified'] = this.isVerified;
    data['expire_date'] = this.expireDate;
    data['admin_seen'] = this.adminSeen;
    data['emailed'] = this.emailed;
    data['hide'] = this.hide;
    return data;
  }
}
