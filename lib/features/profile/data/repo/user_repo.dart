import 'package:dartz/dartz.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/profile/data/model/user_info_model.dart';

abstract class UserRepo {
  Future<Either<Failure,UserInfoModel>> getUSerInfo(int id);
}