import '../../../config/app.dart';

//cache data for 5 minute
class CachedData {
  //register the cached data by the cachedTime
  //to calculate it's validity
  final int cachedTime = DateTime.now().millisecondsSinceEpoch;
  final dynamic data;

  CachedData(this.data);

  //get if the object still valid or timeout
  bool get isValid {
    return DateTime.now().millisecondsSinceEpoch - cachedTime <=
        AppConfig.cachedTimeout;
  }
}
