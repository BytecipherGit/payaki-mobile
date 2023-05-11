import 'package:flutter/material.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_new_pass_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_send_opt_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_verify_otp_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_new_password_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_send_otp_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_success_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_verify_otp_screen.dart';
import 'package:payaki/modules/auth/logIn/provider/log_in_with_phone_send_otp_screen_vm.dart';
import 'package:payaki/modules/auth/logIn/provider/login_provider.dart';
import 'package:payaki/modules/auth/logIn/provider/login_with_phone_verify_otp_screen_vm.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/modules/auth/logIn/screens/login_with_phone_send_otp_screen.dart';
import 'package:payaki/modules/auth/logIn/screens/login_with_phone_verify_otp_screen.dart';
import 'package:payaki/modules/auth/signUp/provider/signup_screen_vm.dart';
import 'package:payaki/modules/auth/signUp/screens/sign_up_screen.dart';
import 'package:payaki/modules/bottomBar/BottomNavigationBarScreen.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/modules/postAdd/provider/location_vm.dart';
import 'package:payaki/modules/postAdd/provider/sub_category_screen_vm.dart';
import 'package:payaki/modules/postAdd/screens/add_detail_screen.dart';
import 'package:payaki/modules/postAdd/screens/add_location_screen.dart';
import 'package:payaki/modules/postAdd/screens/choose_category_screen.dart';
import 'package:payaki/modules/postAdd/screens/gallery_screen.dart';
import 'package:payaki/modules/postAdd/screens/select_add_type_screen.dart';
import 'package:payaki/modules/postAdd/screens/set_price_screen.dart';
import 'package:payaki/modules/postAdd/screens/sub_category_screen.dart';
import 'package:payaki/modules/postAdd/screens/user_detail_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.logInScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());

      case RouteName.loginWithPhoneSendOtpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<LoginWithPhoneSendOtpVm>(
                    create: (_) => LoginWithPhoneSendOtpVm(),
                    child: const LoginWithPhoneSendOtpScreen()));

      case RouteName.loginWithPhoneVerifyOtpScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<LoginWithPhoneVerifyOtpVm>(
                    create: (_) => LoginWithPhoneVerifyOtpVm(),
                    child: LoginWithPhoneVerifyOtpScreen(
                      countryCode: arg["countryCode"],
                      mobile: arg["mobile"],
                    )));

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
                      countryCode: arg["countryCode"],
                      mobile: arg["mobile"]),
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

      case RouteName.subCategoryScreen:
        var arg = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => SubCategoryScreenVm(),
                  child: SubCategoryScreen(
                      catId: arg["catId"], catName: arg["catName"]),
                ));

      case RouteName.addDetailScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => AddDetailScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                ));

      case RouteName.setPriceScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => SetPriceScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  description: arg["description"],
                ));

      case RouteName.galleryScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => GalleryScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  price: arg["price"],
                  description: arg["description"],
                  negotiate: arg["negotiate"],
                ));
      case RouteName.addLocationScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => LocationVm(),
                  child: AddLocationScreen(
                    catId: arg["catId"],
                    subCatId: arg["subCatId"],
                    title: arg["title"],
                    tag: arg["tag"],
                    price: arg["price"],
                    description: arg["description"],
                    negotiate: arg["negotiate"],
                    selectedImages: arg["selectedImages"],
                  ),
                ));

      case RouteName.selectAddTypeScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => SelectAddTypeScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  price: arg["price"],
                  description: arg["description"],
                  negotiate: arg["negotiate"],
                  selectedImages: arg["selectedImages"],
                  location: arg["location"],
                  city: arg["city"],
                  country: arg["country"],
                  latlong: arg["latlong"],
                  state: arg["state"],
                ));

      case RouteName.userDetailScreen:
        return MaterialPageRoute(
            builder: (context) => const UserDetailScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
    }
  }
}
