import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/repository/post_repository.dart';

import '../../../network/model/request/cart/checkout_request.dart';
import '../../../network/model/request/cart/checkout_request.dart';
import '../../../network/model/request/payment/payment_status_request.dart';
import '../../../network/model/response/cart/checkout_cart_response.dart';
import '../../../network/model/response/post/add_post_response.dart';

class AddPostVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  addPostApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<AddPostResponse>? onPaidSuccess,
    ValueChanged<String>? onFailure,
    required List<XFile> images,
    required String productName,
    required String description,
    required int categoryId,
    required int subCategoryId,
    required String price,
    required int negotiable,
    required String location,
    required String city,
    required String country,
    required String latlong,
    required String state,
    required String phone,
    required String sellerName,
    required String availableDays,
    required String tag,
    required String featured,
    required String urgent,
    required String highlight,
    required String? amount,
    required String? currency,
    required String? status,
    required String? paymentId,
  }) async {
    logD("User Id is ${Preference().getUserId()}");

    List<MultipartFile> multiPartList = [];

    for (var a = 0; a < images.length; a++) {
      MultipartFile file = await MultipartFile.fromFile(
        images[a].path,
        filename: images[a].name,
      );
      multiPartList.add(file);
    }
    FormData formData = FormData.fromMap({
      'name': Endpoints.post.addPost,
      'user_id': Preference().getUserId(),
      'product_name': productName,
      'tag': tag,
      'description': description,
      'category': categoryId,
      'sub_category': subCategoryId,
      'price': price,
      'negotiable': negotiable,
      'location': location,
      'city': city,
      'country': country,
      'latlong': latlong,
      'state': state,
      'phone': phone,
      'seller_name': sellerName,
      'available_days': availableDays,
      'product_images[]': multiPartList,
      'featured': featured,
      'urgent': urgent,
      'highlight': highlight,
      'amount': amount,
      'currency': currency,
      'status': status,
      'paymentId': paymentId,
      'payment_method': "paypal",

    });
    postRepository.addPost(formData).then((value) {
      notifyListeners();
      if (value.status) {
        if (value.pramotionType=='paid'){
          onPaidSuccess?.call(value);
        }else{
          onSuccess?.call(value.message ?? "");
        }
   
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call("Server Error");
    });
  }

  checkoutAddPaidPost({
    ValueChanged<CartCheckoutResponse>? onSuccess,
    ValueChanged<String>? onFailure,
    required AddPostRequest request,
  }) {
    postRepository
        .checkoutPaidPost(request)
        .then((value) {
      if (value.code == 200) {
        logD(value.merchantTransactionId);
        onSuccess?.call(value);
      } else {
        onFailure?.call(value.message.toString() ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  checkPaymentStatus({
    ValueChanged<CartCheckoutResponse>? onSuccess,
    ValueChanged<String>? onFailure,
    required PaymentStatusApiRequest request,
  }) {
    postRepository
        .paymentStatusPost(request)
        .then((value) {
      if (value.code == 200) {
        onSuccess?.call(value);
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
  updateUi() {
    notifyListeners();
  }
}
class AddPostRequest {
  String? name;
  AddPostParam? param;

  AddPostRequest({this.name, this.param});

  AddPostRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    param = json['param'] != null ? AddPostParam.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (param != null) {
      data['param'] = param!.toJson();
    }
    return data;
  }
}

class AddPostParam {
  String? product_name;
  String? merchantTransactionId;
  String? totalAmount;
  String? mobileNumber;

  AddPostParam({this.product_name, this.merchantTransactionId, this.totalAmount,this.mobileNumber});

  AddPostParam.fromJson(Map<String, dynamic> json) {
    product_name = json['product_name'];
    merchantTransactionId = json['merchantTransactionId'];
    totalAmount = json['totalAmount'];
    mobileNumber = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = product_name;
    data['merchantTransactionId'] = merchantTransactionId;
    data['totalAmount'] = totalAmount;
    data['mobile'] = mobileNumber;
    return data;
  }
}
