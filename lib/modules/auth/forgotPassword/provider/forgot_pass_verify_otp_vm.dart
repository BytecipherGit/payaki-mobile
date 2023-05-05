import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/forgotPassword/forgot_pass_verify_otp_request.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class ForgotPassVerifyOtpVm extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  verifyOtp({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required ForgotPassVerifyOtpRequest request,
  }) {
    authRepository.forgotPassVerifyOtp(request).then((value) {
      if (value.code == 200) {
        onSuccess.call(value.message ?? "");
      } else {
        onFailure.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      onFailure.call("Server Error");
    });
  }
}
