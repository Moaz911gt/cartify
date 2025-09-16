import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/search/presentation/manager/cubit/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        context.read<SearchCubit>().products = context
            .read<ProductCubit>()
            .allProductsModel!;
        context.read<LayoutCubit>().changeBottomNav(2);
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black12),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}
