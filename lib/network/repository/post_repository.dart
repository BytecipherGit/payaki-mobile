import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/response/basic_response.dart';

class PostRepository {
  Future<BasicResponse> addPost(dynamic data) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data:  data)
        .then((value) => BasicResponse.fromJson(value));
  }
}
