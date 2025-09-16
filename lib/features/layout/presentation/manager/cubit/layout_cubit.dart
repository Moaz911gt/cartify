import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project2/features/cart/presentation/view/products_cart_view.dart';
import 'package:project2/features/home/presentation/views/home_view.dart';
import 'package:project2/features/profile/presentation/view/user_info_view.dart';
import 'package:project2/features/search/presentation/view/search_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  int currentIndex = 0;

  LayoutCubit() : super(LayoutInitial());
  List<Widget> screens = [
    HomeView(),
    ProductsCartView(),
    SearchView(),
    UserInfoView(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ProductChangeBottomNav());
  }
}
