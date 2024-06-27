import 'package:dartz/dartz.dart';
import 'package:eshop/domain/models/product.dart';

import '../../../app/exceptions/failure.dart';
import '../../../data/network/api/main/main_api.dart';
import 'main_repository_implementer.dart';

//Main Repository take all Main methods
abstract class MainRepository {
  factory MainRepository(MainApi api) = MainRepositoryImplementer;

  Future<Either<Failure, List<Product>>> productIndex();
  Future<Either<Failure, HomeModel>> home();
}

class HomeModel {
  final List<Product> products;
  final List<String> categories;
  HomeModel(this.products, this.categories);
}
