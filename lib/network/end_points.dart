class Endpoints {
  const Endpoints._();

  static const baseUrl = "http://themindcrm.com/payaki-web/jwt-api/";
  static AuthEndPoints auth = AuthEndPoints();
  static CategoryEndPoints category = CategoryEndPoints();
}

// TODO API flavours UAT/Production

class AuthEndPoints {
  String get login => "login";
  String get signup => "register";
  String get forgetPasswordSendOtp => "forgetPassword";
  String get forgetPasswordVerifyOtp => "verifyForgetPassword";
  String get generateNewPassword => "generateNewPassword";
}
class CategoryEndPoints {
  String get getCategories => "getCategories";
}
