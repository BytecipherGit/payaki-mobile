import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/location/city_list_response.dart';

class LocationRepository {
  Future<CityListResponse> cityList(BasicRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CityListResponse.fromJson(value));
  }
}
