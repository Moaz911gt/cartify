part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class Productlooding extends ProductState {}

final class Productsuccess extends ProductState {
  final List<ProductstModel> model;

  Productsuccess({required this.model});
}

final class Productfailure extends ProductState {
  final String errmessage;

  Productfailure({required this.errmessage});
}

final class ProductCartUpdated extends ProductState {}
final class CounterIncreaseSuccess extends ProductState {}
final class CounterDecreaseSuccess extends ProductState {}





