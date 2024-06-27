import 'package:dartz/dartz.dart';
import 'package:eshop/app/support/helpers.dart';
import 'package:eshop/domain/models/product.dart';
import '../../../app/exceptions/failure.dart';
import '../../../app/exceptions/handler.dart';
import '../../../config/error_data_source.dart';
import '../../../data/network/api/main/main_api.dart';
import 'main_repository.dart';

//Main Repository Implementer implements Main methods
class MainRepositoryImplementer implements MainRepository {
  final MainApi _api;

  MainRepositoryImplementer(this._api);

  @override
  Future<Either<Failure, List<Product>>> productIndex() async {
    if (await isInternetConnected) {
      try {
        return Right(await _api.productIndex());
      } catch (e) {
        return Left(Handler.handle(e).failure);
      }
    }
    return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
  }

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await isInternetConnected) {
      // try {
      List result = await Future.wait([
        _api.productIndex(),
        _api.categoriesIndex(),
      ]);
      return Right(HomeModel(result[0], result[1]));
      // } catch (e) {
      //   return Left(Handler.handle(e).failure);
      // }
    }

    return Left(ErrorDataSourceConfig.noInternetConnection.getFailure);
  }
}
