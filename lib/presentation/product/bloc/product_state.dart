part of 'product_cubit.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState implements LoadingState {}

final class ProductError extends ProductState implements ErrorState {
  @override
  final BaseFailure failure;
  ProductError(this.failure);
}

final class ProductView extends ProductState {}
