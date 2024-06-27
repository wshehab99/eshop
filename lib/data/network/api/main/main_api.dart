import '../../../../domain/models/product.dart';
import '../../dio/methods/dio_methods.dart';
import 'main_api_implementer.dart';

abstract class MainApi {
  factory MainApi(DioMethods dio) = MainApiImplementer;
  Future<List<Product>> productIndex();
  Future<List<String>> categoriesIndex();
}
