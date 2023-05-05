import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/category/category_list_request.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart';

class CategoryRepository {
  Future<CategoryListResponse> categoryList(CategoryListRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CategoryListResponse.fromJson(value));
  }
}
