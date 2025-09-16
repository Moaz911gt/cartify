import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:project2/features/search/presentation/view/widgets/search_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLooding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return ListView.separated(
            itemCount: state.productsModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 8,
                ),
                child: SearchItem(products: state.productsModel[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(thickness: 1, color: Colors.black12),
            ),
          );
        } else {
          return Center(child: const Text('search'));
        }
      },
    );
  }
}
