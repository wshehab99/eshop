import 'remote_data_source_implementer.dart';

//remote data source class combine all remote sources and get one place to go throughout
// it just point to the method in the real API interfaces
//just for group the methods of remote sources and then segment them
//based on screen segmentation
abstract class RemoteDataSource {
  factory RemoteDataSource() => RemoteDataSourceImplementer();
}
