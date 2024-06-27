//contains the values that it should be constant of all  app run time
//like sharedPreferences keys and timeouts
abstract class AppConfig {
  static const String token = "/token";
  static const String user = "/user";
  static const String contentType = "Content-Type";
  static const String connection = "Connection";
  static const String keepAlive = "keep-alive";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
  static const String language = "lang";
  static const String country = "country";
  static const String defaultCountry = "sa";
  static const String paginate = "paginate";
  static const String authorization = "Authorization";
  static const Duration timeout = Duration(seconds: 30);
  static const String empty = "";
  static const String ar = "ar";
  static const String en = "en";
  static const int cachedTimeout = 1000 * 60 * 5;
  static const Duration splashDelay = Duration(seconds: 1, milliseconds: 500);
  static const Duration fadeDuration = Duration(milliseconds: 300);
  static const Duration animationDelay1 = Duration(milliseconds: 175);
  static const Duration animationDelay2 = Duration(milliseconds: 150);
  static const String dateFormat = 'MM-dd-yyyy';
  static const String timeFormat = 'hh:mm a';
}
