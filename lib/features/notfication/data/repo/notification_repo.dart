import 'package:dartz/dartz.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/notfication/data/model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    required String userId,
  });
  Future<Either<Failure, void>> addNotifications({
    required String userId,
    required NotificationModel notificationModel,
  });

    Future<Either<Failure, void>> deleteNotifications({
    required String userId,
    required String subId
  });
}
