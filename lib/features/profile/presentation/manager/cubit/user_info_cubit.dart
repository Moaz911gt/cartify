import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project2/features/profile/data/model/user_info_model.dart';
import 'package:project2/features/profile/data/repo/user_repo_impl.dart';

part 'user_info_state.dart';

class UserinfoCubit extends Cubit<UserinfoState> {
  UserinfoCubit() : super(UserinfoInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Future<void> getUser(int id) async {
    emit(UserinfoLooding());
    final result = await UserRepoImpl().getUSerInfo(id);
    result.fold(
      (failure) {
        emit(UserinfoFailure(errMessage: failure.message));
      },
      (user) {
        nameController.text = user.name!;
        emailController.text = user.email!;
        cityController.text = user.city;
        phoneController.text = user.phone;

        emit(UserinfoSuccess(userInfoModel: user));
      },
    );
  }
}
