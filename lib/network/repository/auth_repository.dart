
import 'package:dio/dio.dart';
import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/forgotPassword/forgot_pass_send_otp_request.dart';
import 'package:payaki/network/model/request/forgotPassword/forgot_pass_verify_otp_request.dart';
import 'package:payaki/network/model/request/forgotPassword/generate_new_pass_request.dart';
import 'package:payaki/network/model/request/loginSignup/login_request.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_send_otp_request.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_verify_otp_request.dart';
import 'package:payaki/network/model/request/loginSignup/signup_request.dart';
import 'package:payaki/network/model/request/loginSignup/social_login_request.dart';
import 'package:payaki/network/model/response/auth/login_response.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/forgotPassword/forgot_pass_send_otp_response.dart';

class AuthRepository {
  Future<LogInResponse> logIn(LogInRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => LogInResponse.fromJson(value));
  }

  Future<ForgotPassSendOtpResponse> loginWithPhoneSendOtp(
      LoginWithPhoneSendOtpRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => ForgotPassSendOtpResponse.fromJson(value));
  }

  Future<LogInResponse> loginWithPhoneVerifyOtp(
      LoginWithPhoneVerifyOtpRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => LogInResponse.fromJson(value));
  }

  Future<LogInResponse> socialLogIn(SocialLoginRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => LogInResponse.fromJson(value));
  }


  Future<LogInResponse> signup(SignUpRequest request) {
    return DioHttpService.apiServicesInstance
        //  .post(Endpoints.baseUrl, data: request.toJson())
        .post(Endpoints.baseUrl, data: FormData.fromMap(request.toJson()))
        .then((value) => LogInResponse.fromJson(value));
  }

  Future<ForgotPassSendOtpResponse> forgotPassSendOtp(
      ForgotPassSendOtpRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => ForgotPassSendOtpResponse.fromJson(value));
  }

  Future<BasicResponse> forgotPassVerifyOtp(
      ForgotPassVerifyOtpRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<BasicResponse> generateNewPass(GenerateNewPassRequest request) {
    return DioHttpService.apiServicesInstance
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }
}
