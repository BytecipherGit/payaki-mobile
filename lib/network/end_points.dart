class Endpoints {
  const Endpoints._();

  static const baseUrl = "http://themindcrm.com/payaki-web/jwt-api/";
  static AuthEndPoints auth = AuthEndPoints();
  static CategoryEndPoints category = CategoryEndPoints();
  static PostEndPoints post = PostEndPoints();
  static LocationEndPoints location = LocationEndPoints();
  static SearchEndPoints search = SearchEndPoints();
  static ReviewEndPoints reviewEndPoints = ReviewEndPoints();
  static UserProfileEndPoints userProfileEndPoints = UserProfileEndPoints();
  static ChatEndPoints chatEndPoints = ChatEndPoints();
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
  String get changePassword => "changePassword";
}
class CategoryEndPoints {
  String get getCategories => "getCategories";
  String get getSubCategories => "getSubCategories";
}
class PostEndPoints {
  String get addPost => "addPost";
  String get getPostDetails => "getPostDetails";
  String get likeDislikePost => "likeDislikePost";
  String get premiumAndLatestPost => "getPremiumAndLatestPost";
  String get getUserPost => "getUserPost";

  String get allParam => "all";
  String get favouriteParam => "favourite";

  String get expireParam => "expire";
  String get pendingParam => "pending";
}

class LocationEndPoints {
  String get getCities => "getCities";
}

class SearchEndPoints {
  String get getAllPost => "getAllPost";
}

class ReviewEndPoints {
  String get addReview => "reviewAndRating";
  String get replyByEmail => "replyByEmail";
  String get reportViolation => "reportViolation";
  String get placeQuote => "placeQuote";
}

class UserProfileEndPoints {
  String get viewProfile => "viewProfile";
  String get resendConfirmationEmail => "resendConfirmationEmail";
  String get getCountries => "getCountries";
  String get updateProfile => "updateProfile";
  String get getTransactionListing => "getTransactionListing";
}
class ChatEndPoints {
  String get chatUserListing => "chatUserListing";
}


