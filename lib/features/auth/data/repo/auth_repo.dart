

import 'package:dartz/dartz.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/auth/data/model/register_model.dart';

abstract class AuthRepo {
  Future<Either<Failure,String>> login(String userName, password);
    Future<Either<Failure, void>> signUp(RegisterModel registerModel);

}