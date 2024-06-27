import 'package:dio/dio.dart';
import 'package:eshop/domain/models/product.dart';

import '../../../../config/api.dart';
import '../../dio/methods/dio_methods.dart';
import 'main_api.dart';

class MainApiImplementer implements MainApi {
  final DioMethods _dio;

  MainApiImplementer(this._dio);

  @override
  Future<List<Product>> productIndex() async {
    Response response = await _dio.get<List<Product>>(path: ApiConfig.products);
    return Product.fromList(response.data);
  }

  @override
  Future<List<String>> categoriesIndex() async {
    Response response =
        await _dio.get<List<String>>(path: ApiConfig.categories);
    print(response.data.runtimeType);
    [].map((e) => e.toString()).toList();
    return CatResponse.fromJson(response.data).data;
  }
}

class CatResponse {
  final List<String> data;
  CatResponse(this.data);
  factory CatResponse.fromJson(List json) =>
      CatResponse(json.map((e) => e.toString()).toList());
}
