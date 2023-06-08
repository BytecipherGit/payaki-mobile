import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/userProfile/resend_email_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/profile/user_profile_response.dart';

class UserProfileRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<UserProfileResponse> getUserDetail(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => UserProfileResponse.fromJson(value));
  }

  Future<BasicResponse> resendEmail(ResendEmailRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

}
