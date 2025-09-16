part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  final String token;

  LoginSuccess({required this.token});
}

final class LoginFailure extends AuthState {
  final String errmessage;

  LoginFailure({required this.errmessage});
}

final class LoginLooding extends AuthState {}


final class RegisterSuccess extends AuthState {
  final RegisterModel registerModel;

  RegisterSuccess({required this.registerModel});
}

final class RegisterLooding extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errMassage;

  RegisterFailure({required this.errMassage});
}
