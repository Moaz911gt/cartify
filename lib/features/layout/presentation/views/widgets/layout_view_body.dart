import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/search/presentation/manager/cubit/search_cubit.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              if (index == 2) {
                context.read<SearchCubit>().products = context
                    .read<ProductCubit>()
                    .allProductsModel!;
              }else if(index==1){
                context.read<CartCubit>().readCart();
              }
              cubit.changeBottomNav(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
          ),
        );
      },
    );
    
  }
}