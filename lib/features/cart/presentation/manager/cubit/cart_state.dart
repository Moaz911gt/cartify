part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddSuccess extends CartState {}

final class AddLoading extends CartState {}

final class Addfailure extends CartState {
  final String errmessage;

  Addfailure({required this.errmessage});
}

final class DeleteSuccess extends CartState {}

final class DeleteLoading extends CartState {}

final class Deletefailure extends CartState {
  final String errmessage;

  Deletefailure({required this.errmessage});
}

final class UpdateSuccess extends CartState {}

final class UpdateLoading extends CartState {}

final class Updatefailure extends CartState {
  final String errmessage;

  Updatefailure({required this.errmessage});
}

final class ReadSuccess extends CartState {}

final class ReadLoading extends CartState {}

final class Readfailure extends CartState {
  final String errmessage;

  Readfailure({required this.errmessage});
}
