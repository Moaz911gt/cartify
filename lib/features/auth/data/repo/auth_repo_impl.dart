import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project2/core/service/data%20source/api_service.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/auth/data/model/register_model.dart';
import 'package:project2/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, String>> login(String userName, password) async {
    try {
      final Response response = await ApiService.post(
        path: 'auth/login',
        data: {"username": userName, "password": password},
        query: null,
      );
      final token = response.data['token'];
      return right(token);
    } catch (e) {
      return left(Failure.defaultMessage());
    }
  }

  @override
  Future<Either<Failure, void>> signUp(RegisterModel registerModel) async {
    try {
      await ApiService.post(
        query: null,
        path: 'users',
        data: registerModel.toJson(),
      );
    
      return right(null);
    } catch (e) {
      return left(Failure.defaultMessage());
    }
  }

  // Future<Either<Failure,LoginModel>> Login()async{

  //   try {
  //     final Response response=await Api.post(path: 'auth/login');
  //   } catch (e) {
  //           return left(Failure.defaultMessage());

  //   }
  // }
}
