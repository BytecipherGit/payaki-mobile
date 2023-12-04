import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/event/event_checkout_request.dart';
import 'package:payaki/network/model/request/event/event_list_request.dart';
import 'package:payaki/network/model/request/post/delete_post_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/event/event_list_response.dart';

import '../model/response/cart/checkout_cart_response.dart';

class EventRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<EventListResponse> eventList(EventListRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => EventListResponse.fromJson(value));
  }

  Future<BasicResponse> deletePost(DeletePostRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<CartCheckoutResponse> eventCheckout(EventCheckoutRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) =>CartCheckoutResponse.fromJson(value));
  }


}
