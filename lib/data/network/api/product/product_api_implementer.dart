import 'package:dio/dio.dart';
import 'package:eshop/domain/models/product.dart';

import '../../../../config/api.dart';
import '../../dio/methods/dio_methods.dart';
import 'product_api.dart';

class ProductApiImplementer implements ProductApi {
  final DioMethods _dio;

  ProductApiImplementer(this._dio);

  @override
  Future<List<Product>> categoryProducts(String category) async {
    Response response = await _dio.get<List<Product>>(
      path: ApiConfig.categoryProducts(category),
    );
    return Product.fromList(response.data);
  }
}
