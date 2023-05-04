import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/auth/login_request.dart';
import 'package:payaki/network/model/request/auth/signup_request.dart';
import 'package:payaki/network/model/response/auth/login_response.dart';

class AuthRepository {
  Future<LogInResponse> logIn(LogInRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => LogInResponse.fromJson(value));
  }

  Future<LogInResponse> signup(SignUpRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => LogInResponse.fromJson(value));
  }
}