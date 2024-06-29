import 'package:dartz/dartz.dart';

import 'package:eshop/app/exceptions/failure.dart';

import 'package:eshop/domain/models/product.dart';

import '../../../app/exceptions/handler.dart';
import '../../../app/support/helpers.dart';
import '../../../config/error_data_source.dart';
import '../../../data/network/api/product/product_api.dart';
import 'product_repository.dart';

//Main Repository Implementer implements Main methods
class ProductRepositoryImplementer implements ProductRepository {
  final ProductApi _api;

  ProductRepositoryImplementer(this._api);

  @override
  Future<Either<Failure, List<Product>>> categoryProducts(
      String category) async {
    if (await isInternetConnected) {
      try {
        return Right(await _api.categoryProducts(category));
      } catch (e) {
        return Left(Handler.handle(e).failure);
      }
    }
    return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
  }

  @override
  Future<Either<Failure, Product>> showProduct(int id) async {
    if (await isInternetConnected) {
      try {
        return Right(await _api.showProduct(id));
      } catch (e) {
        return Left(Handler.handle(e).failure);
      }
    }
    return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
  }
}
