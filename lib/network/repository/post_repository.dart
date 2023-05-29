import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/post_detail_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/post/post_detail_response.dart';

class PostRepository {
  Future<BasicResponse> addPost(dynamic data) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: data)
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<PostDetailResponse> postDetails(PostDetailRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => PostDetailResponse.fromJson(value));
  }
}
