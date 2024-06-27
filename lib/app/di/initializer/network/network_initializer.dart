import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../data/network/dio/factory/dio_factory.dart';
import '../../../../data/network/dio/methods/dio_methods.dart';
import '../../../../data/network/info/network_info.dart';
import '../../../observers/http_overrides.dart';
import '../../../support/helpers.dart';
import 'api_initializer.dart';
import 'data_source_initializer.dart';
import 'repository_initializer.dart';

abstract class NetworkInitializer {
  static void setNetwork() {
    //network info
    HttpOverrides.global = HttpOverridesObserver();
    register<NetworkInfo>(() => NetworkInfo(InternetConnectionChecker()));
    //dio methods
    register<DioMethods>(() => DioMethods(DioFactory().getDio));
    //apis
    APIInitializer.setApis();
    //  data sources
    DataSourceInitializer.setDataSource();
    // repository
    RepositoryInitializer.setRepository();
  }
}
