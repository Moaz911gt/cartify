import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';

import 'package:project2/features/cart/presentation/view/widget/products_cart_view_body.dart';
import 'package:project2/features/notfication/presentation/manager/notificationcubit/notification_cubit.dart';

class ProductsCartView extends StatefulWidget {
  const ProductsCartView({super.key});

  @override
  State<ProductsCartView> createState() => _ProductsCartViewState();
}

class _ProductsCartViewState extends State<ProductsCartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: NotificationCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().clearCart();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.delete_outline),
              ),
            ),
          ],
        ),
        body: ProductsCartViewBody(),
      ),
    );
  }
}
