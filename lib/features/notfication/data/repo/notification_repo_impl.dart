import 'package:dartz/dartz.dart';
import 'package:project2/constants.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/core/service/data%20source/firestore_service.dart';
import 'package:project2/features/notfication/data/model/notification_model.dart';
import 'package:project2/features/notfication/data/repo/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  final FirestoreService firestoreService = FirestoreService();
  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    required String userId,
  }) async {
    try {
      final data = await firestoreService.getDataFromSubCollection(
        userId,
        kUsercollection,
        kNotifications,
      );
      return right(
        data.map((e) {
          return NotificationModel.fromJson(e);
        }).toList(),
      );
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addNotifications({
    required String userId,
    required NotificationModel notificationModel,
  }) async {
    try {
      await firestoreService.addDataToSubCollection(
        userId,
        notificationModel.id.toString(),
        kUsercollection,
        kNotifications,
        notificationModel.toJson(),
      );
      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotifications({
    required String userId,
    required String subId,
  }) async {
    try {
      await firestoreService.deleteDataToSubCollection(
        userId,
        subId,
        kUsercollection,
        kNotifications,
      );
      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
