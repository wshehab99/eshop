import 'package:eshop/domain/repository/product/product_repository.dart';

import '../../../../data/network/api/main/main_api.dart';
import '../../../../data/network/api/product/product_api.dart';
import '../../../../domain/repository/main/main_repository.dart';
import '../../../support/helpers.dart';

abstract class RepositoryInitializer {
  static void setRepository() {
    register<MainRepository>(() => MainRepository(sl<MainApi>()));
    register<ProductRepository>(() => ProductRepository(sl<ProductApi>()));
  }
}
