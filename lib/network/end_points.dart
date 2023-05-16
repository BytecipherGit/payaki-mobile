class Endpoints {
  const Endpoints._();

  static const baseUrl = "http://themindcrm.com/payaki-web/jwt-api/";
  static AuthEndPoints auth = AuthEndPoints();
  static CategoryEndPoints category = CategoryEndPoints();
  static PostEndPoints post = PostEndPoints();
  static LocationEndPoints location = LocationEndPoints();
  static SearchEndPoints search = SearchEndPoints();
}

// TODO API flavours UAT/Production

class AuthEndPoints {
  String get login => "login";
  String get socialLogin => "social_login";
  String get loginWithPhone => "loginWithPhone";
  String get verifyLoginOTP => "verifyLoginOTP";
  String get signup => "register";
  String get forgetPasswordSendOtp => "forgetPassword";
  String get forgetPasswordVerifyOtp => "verifyForgetPassword";
  String get generateNewPassword => "generateNewPassword";
}
class CategoryEndPoints {
  String get getCategories => "getCategories";
  String get getSubCategories => "getSubCategories";
}
class PostEndPoints {
  String get addPost => "addPost";
}

class LocationEndPoints {
  String get getCities => "getCities";
}

class SearchEndPoints {
  String get getAllPost => "getAllPost";
}


