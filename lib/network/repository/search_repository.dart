import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/search/search_request.dart';
import 'package:payaki/network/model/response/search/search_result_response.dart';

class SearchRepository {

  Future<SearchResultResponse> searchPost(SearchRequest data) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data:  data.toJson())
        .then((value) => SearchResultResponse.fromJson(value));
  }

}
