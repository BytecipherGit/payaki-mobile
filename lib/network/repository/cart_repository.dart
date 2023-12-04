import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/cart/add_and_remove_cart_request.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/cart/cart_list_response.dart';

import '../model/response/cart/checkout_cart_response.dart';

class CartRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<BasicResponse> addAndRemoveToCart(AddAndRemoveCartRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<CartListResponse> cartList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CartListResponse.fromJson(value));
  }

  Future<CartCheckoutResponse> checkoutCart(CheckoutRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CartCheckoutResponse.fromJson(value));
  }
}
