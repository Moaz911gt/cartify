import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/features/notfication/data/model/notification_model.dart';
import 'package:project2/features/notfication/data/repo/notification_repo_impl.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationCubitInitial());

  getNotifications(String userId) async {
    emit(GetNotificationLooding());

    var res = await NotificationRepoImpl().getNotifications(userId: userId);
    res.fold(
      (failure) {
        emit(GetNotificationFailure(errMessage: failure.message));
      },
      (notifications) {
        emit(GetNotificationSuccess(notificationModel: notifications));
      },
    );
  }

  addNotifications(String userId, NotificationModel notificationModel) async {
    emit(AddNotificationLooding());
    var res = await NotificationRepoImpl().addNotifications(
      userId: userId,
      notificationModel: notificationModel,
    );
    res.fold(
      (failure) {
        emit(AddNotificationFailure(errMessage: failure.message));
      },
      (success) {
        emit(AddNotificationSuccess());
      },
    );
  }

  deleteNotification(String userId, String subId) async {
    emit(DeleteNotificationLooding());
    var res = await NotificationRepoImpl().deleteNotifications(
      userId: userId,
      subId: subId,
    );
    res.fold(
      (failure) {
        emit(DeleteNotificationFailure(errMessage: failure.message));
      },
      (success) {
        emit(DeleteNotificationSuccess());
        getNotifications(userId);
      },
    );
  }
}
