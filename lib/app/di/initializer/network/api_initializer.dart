import 'package:eshop/data/network/api/product/product_api.dart';

import '../../../../data/network/api/main/main_api.dart';
import '../../../../data/network/dio/methods/dio_methods.dart';
import '../../../support/helpers.dart';

abstract class APIInitializer {
  static void setApis() {
    //api
    register<MainApi>(() => MainApi(sl<DioMethods>()));
    register<ProductApi>(() => ProductApi(sl<DioMethods>()));
  }
}
