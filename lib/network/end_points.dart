class Endpoints {
  const Endpoints._();

  static const baseUrl = "http://themindcrm.com/payaki-web/jwt-api/";
  static AuthEndPoints auth = AuthEndPoints();
}

// TODO API flavours UAT/Production

class AuthEndPoints {
  String get login => "login";
  String get signup => "register";
}
