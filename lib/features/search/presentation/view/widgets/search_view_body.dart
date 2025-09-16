import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/auth/presentation/view/widgets/custem_text_field.dart';
import 'package:project2/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:project2/features/search/presentation/view/widgets/products_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextField(
          onChanged: (value) {
            BlocProvider.of<SearchCubit>(
              context,
            ).searchProducts(productName: value);
          },
          hint: 'search',
        ),
      ),
      body: ProductsListView(),
      backgroundColor: Colors.white,
    );
  }
}
