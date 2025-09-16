import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project2/core/service/data%20source/api_service.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/profile/data/model/user_info_model.dart';
import 'package:project2/features/profile/data/repo/user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  Future<Either<Failure, UserInfoModel>> getUSerInfo(int id) async {
    try {
      final Response response = await ApiService.get(
        path: 'users/$id',
        query: null,
      );
      final user = UserInfoModel.fromJson(response.data);
      return right(user);
    } catch (e) {
      return left(Failure.defaultMessage());
    }
  }
}
