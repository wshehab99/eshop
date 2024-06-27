import 'local_data_source_implementer.dart';

//Local Data Source Interface
abstract class LocalDataSource {
  factory LocalDataSource() = LocalDataSourceImplementer;
}
