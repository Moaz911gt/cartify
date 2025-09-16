import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/profile/presentation/manager/cubit/user_info_cubit.dart';
import 'package:project2/features/profile/presentation/view/widgets/user_info_body.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserinfoCubit()..getUser(1),
        child: UserInfoBody(),
      ),
    );
  }
}
