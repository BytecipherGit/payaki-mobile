class TrainingListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  TrainingListResponse({this.status, this.code, this.message, this.data});

  TrainingListResponse.fromJson(Map<String, dynamic> json) {
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
  String? eventDate;
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
  String? createdAt;
  String? updatedAt;
  String? expireDays;
  String? expiredDate;
  String? isVerified;
  String? expireDate;
  String? featuredExpDate;
  String? urgentExpDate;
  String? highlightExpDate;
  String? adminSeen;
  String? emailed;
  String? hide;
  String? catName;
  String? subCatName;
  String? cityName;
  String? stateName;
  String? countryName;
  String? fullAddress;
  List<String>? image;
  List<Gallery>? gallery;

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
        this.catName,
        this.subCatName,
        this.cityName,
        this.stateName,
        this.countryName,
        this.fullAddress,
        this.image,
        this.gallery});

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
    eventDate = json['event_date'];
    eventTime = json['event_time'];
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
    featuredExpDate = json['featured_exp_date'];
    urgentExpDate = json['urgent_exp_date'];
    highlightExpDate = json['highlight_exp_date'];
    adminSeen = json['admin_seen'];
    emailed = json['emailed'];
    hide = json['hide'];
    catName = json['cat_name'];
    subCatName = json['sub_cat_name'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    countryName = json['country_name'];
    fullAddress = json['full_address'];
    image = json['image'].cast<String>();
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
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
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
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
    data['featured_exp_date'] = this.featuredExpDate;
    data['urgent_exp_date'] = this.urgentExpDate;
    data['highlight_exp_date'] = this.highlightExpDate;
    data['admin_seen'] = this.adminSeen;
    data['emailed'] = this.emailed;
    data['hide'] = this.hide;
    data['cat_name'] = this.catName;
    data['sub_cat_name'] = this.subCatName;
    data['city_name'] = this.cityName;
    data['state_name'] = this.stateName;
    data['country_name'] = this.countryName;
    data['full_address'] = this.fullAddress;
    data['image'] = this.image;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gallery {
  String? id;
  String? productId;
  String? trainingVideo;

  Gallery({this.id, this.productId, this.trainingVideo});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    trainingVideo = json['training_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['training_video'] = this.trainingVideo;
    return data;
  }
}
