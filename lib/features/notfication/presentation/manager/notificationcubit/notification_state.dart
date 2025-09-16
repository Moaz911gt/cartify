part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationCubitInitial extends NotificationState {}

final class GetNotificationSuccess extends NotificationState {
  final List<NotificationModel> notificationModel;

  GetNotificationSuccess({required this.notificationModel});
}

final class GetNotificationFailure extends NotificationState {
  final String errMessage;

  GetNotificationFailure({required this.errMessage});
}

final class GetNotificationLooding extends NotificationState {}

final class AddNotificationLooding extends NotificationState {}

final class AddNotificationSuccess extends NotificationState {}

final class AddNotificationFailure extends NotificationState {
  final String errMessage;

  AddNotificationFailure({required this.errMessage});
}

final class DeleteNotificationLooding extends NotificationState {}

final class DeleteNotificationSuccess extends NotificationState {}

final class DeleteNotificationFailure extends NotificationState {
  final String errMessage;

  DeleteNotificationFailure({required this.errMessage});
}
