import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/auth/signup_request.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  signUp({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required SignUpRequest request,
  }) {
    authRepository.signup(request).then((value) {
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
