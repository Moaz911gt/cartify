import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/features/auth/data/model/register_model.dart';
import 'package:project2/features/auth/data/repo/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String userName, password) async {
    emit(LoginLooding());
    final result = await AuthRepoImpl().login(userName, password);
    result.fold((failure) => emit(LoginFailure(errmessage: failure.message)), (
      token,
    ) async {
      await CacheHelper.setString('token', token);
      emit(LoginSuccess(token: token));
    });
  }

  Future<void> register(RegisterModel registerModel) async {
    String userJson = jsonEncode(registerModel.toJson());
    print(userJson);
    CacheHelper.setString('user', userJson);
    emit(RegisterLooding());
    final result = await AuthRepoImpl().signUp(registerModel);
    result.fold(
      (failure) => emit(RegisterFailure(errMassage: failure.message)),
      (success) => emit(RegisterSuccess(registerModel: registerModel)),
    );
  }
}
