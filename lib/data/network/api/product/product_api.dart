import '../../../../domain/models/product.dart';
import '../../dio/methods/dio_methods.dart';
import 'product_api_implementer.dart';

abstract class ProductApi {
  factory ProductApi(DioMethods dio) = ProductApiImplementer;
  Future<List<Product>> categoryProducts(String category);
}
