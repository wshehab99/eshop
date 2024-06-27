import '../../../../data/source/local/local_data_source.dart';
import '../../../../data/source/remote/remote_data_source.dart';
import '../../../support/helpers.dart';

abstract class DataSourceInitializer {
  static void setDataSource() {
    _setLocalDataSource();
    _setRemoteDataSource();
  }

  static void _setLocalDataSource() {
    // local data sources
    register<LocalDataSource>(() => LocalDataSource());
  }

  static void _setRemoteDataSource() {
    // remote data sources
    register(() => RemoteDataSource());
  }
}
