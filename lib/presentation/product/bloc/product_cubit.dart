import 'package:eshop/resources/base/base_state.dart';
import 'package:eshop/resources/base/state_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/product.dart';
import '../../../domain/repository/product/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repository) : super(ProductInitial());
  final ProductRepository _repository;
  List<Product> products = [];

  void categoryProducts(String category) async {
    emit(ProductLoading());
    (await _repository.categoryProducts(category)).fold(
        (l) => emit(ProductError(l.toBase(() => categoryProducts(category)))),
        (r) {
      products = r;
      emit(ProductView());
    });
  }

  late Product product;
  void showProduct(int id) async {
    emit(ProductLoading());
    (await _repository.showProduct(id))
        .fold((l) => emit(ProductError(l.toBase(() => showProduct(id)))), (r) {
      product = r;
      emit(ProductView());
    });
  }
}
