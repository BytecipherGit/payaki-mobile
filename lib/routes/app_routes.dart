import 'package:flutter/material.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_new_password_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_send_otp_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_success_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_verify_otp_screen.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/modules/auth/signUp/screens/sign_up_screen.dart';
import 'package:payaki/routes/route_name.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.logInScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RouteName.forgotPassSendOtpScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPassSendOtpScreen());
      case RouteName.forgotPassVerifyOtpScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPassVerifyOtpScreen());
      case RouteName.forgotNewPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotNewPasswordScreen());
      case RouteName.forgotPassSuccessScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPassSuccessScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
    }
  }
}
