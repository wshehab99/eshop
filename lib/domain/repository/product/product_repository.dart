import 'package:dartz/dartz.dart';
import 'package:eshop/app/exceptions/failure.dart';

import '../../../data/network/api/product/product_api.dart';
import '../../models/product.dart';
import 'product_repository_implementer.dart';

//Main Repository take all Main methods
abstract class ProductRepository {
  factory ProductRepository(ProductApi api) = ProductRepositoryImplementer;
  Future<Either<Failure, List<Product>>> categoryProducts(String category);
  Future<Either<Failure, Product>> showProduct(int id);
}
