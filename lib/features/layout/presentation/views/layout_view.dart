import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/layout/presentation/views/widgets/layout_view_body.dart';
import 'package:project2/features/search/presentation/manager/cubit/search_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SearchCubit()),
          BlocProvider(create: (context) => ProductCubit()..getProducts()),
          BlocProvider(create: (context) => CartCubit()..readCart()),
          BlocProvider(create: (context) => LayoutCubit()),
        ],
        child: LayoutViewBody(),
      ),
    );
  }
}
