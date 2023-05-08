import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_verify_otp_request.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class LoginWithPhoneVerifyOtpVm extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  verifyOtp({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required LoginWithPhoneVerifyOtpRequest request,
  }) {
    authRepository.loginWithPhoneVerifyOtp(request).then((value) {
      if (value.code == 200) {
        Preference.setUserId(value.data?.id);
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
