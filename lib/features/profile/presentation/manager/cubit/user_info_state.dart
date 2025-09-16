part of 'user_info_cubit.dart';

@immutable
sealed class UserinfoState {}

final class UserinfoInitial extends UserinfoState {}

final class UserinfoSuccess extends UserinfoState {
  final UserInfoModel userInfoModel;

  UserinfoSuccess({required this.userInfoModel});
}

final class UserinfoFailure extends UserinfoState {
  final String errMessage;

  UserinfoFailure({required this.errMessage});
}

final class UserinfoLooding extends UserinfoState {}
