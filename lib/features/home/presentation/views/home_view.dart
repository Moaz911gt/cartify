import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/functions/custom_snack_bar.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';

import 'package:project2/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddSuccess) {
            customSnackBar(context, 'product added succesfully', Colors.green);
          } else if (state is Addfailure) {
            customSnackBar(context, state.errmessage, Colors.red);
          } else if (state is DeleteSuccess) {
            customSnackBar(context, 'product deleted succesfully', Colors.red);
          } else if (state is Deletefailure) {
            customSnackBar(context, state.errmessage, Colors.red);
          }
        },
        child: HomeViewBody(),
      ),
    );
  }
}
