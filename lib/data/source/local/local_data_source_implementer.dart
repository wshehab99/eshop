import 'cached_data.dart';
import 'local_data_source.dart';

//Local Data Source Interface Implementer
class LocalDataSourceImplementer implements LocalDataSource {
  //cached data map
  Map<String, CachedData> data = {};
}
