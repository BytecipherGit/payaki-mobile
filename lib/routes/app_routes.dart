import 'package:flutter/material.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_new_pass_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_send_opt_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_verify_otp_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_new_password_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_send_otp_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_success_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_verify_otp_screen.dart';
import 'package:payaki/modules/auth/logIn/provider/login_provider.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/modules/auth/signUp/provider/signup_screen_vm.dart';
import 'package:payaki/modules/auth/signUp/screens/sign_up_screen.dart';
import 'package:payaki/modules/bottomBar/BottomNavigationBarScreen.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/modules/postAdd/screens/add_detail_screen.dart';
import 'package:payaki/modules/postAdd/screens/add_location_screen.dart';
import 'package:payaki/modules/postAdd/screens/choose_category_screen.dart';
import 'package:payaki/modules/postAdd/screens/gallery_screen.dart';
import 'package:payaki/modules/postAdd/screens/set_price_screen.dart';
import 'package:payaki/modules/postAdd/screens/user_detail_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.logInScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<SignUpVm>(
                create: (_) => SignUpVm(), child: const SignUpScreen()));
      case RouteName.forgotPassSendOtpScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotPassSendOtpVm(),
                  child: const ForgotPassSendOtpScreen(),
                ));
      case RouteName.forgotPassVerifyOtpScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotPassVerifyOtpVm(),
                  child: ForgotPassVerifyOtpScreen(
                    userId: arg["userId"],
                  ),
                ));

      case RouteName.forgotNewPasswordScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotNewPassVm(),
                  child: ForgotNewPasswordScreen(
                    userId: arg["userId"],
                  ),
                ));

      case RouteName.forgotPassSuccessScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPassSuccessScreen());
      case RouteName.bottomNavigationBarScreen:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen());

      case RouteName.chooseCategoryScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ChooseCategoryScreenVm(),
                  child: const ChooseCategoryScreen(),
                ));

      case RouteName.addDetailScreen:
        return MaterialPageRoute(builder: (context) => const AddDetailScreen());

      case RouteName.setPriceScreen:
        return MaterialPageRoute(builder: (context) => const SetPriceScreen());
      case RouteName.galleryScreen:
        return MaterialPageRoute(builder: (context) => const GalleryScreen());
      case RouteName.addLocationScreen:
        return MaterialPageRoute(
            builder: (context) => const AddLocationScreen());
      case RouteName.userDetailScreen:
        return MaterialPageRoute(
            builder: (context) => const UserDetailScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
    }
  }
}
