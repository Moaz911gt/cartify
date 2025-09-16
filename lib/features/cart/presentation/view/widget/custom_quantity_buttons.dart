import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';

class CustomQuantityButton extends StatelessWidget {
  const CustomQuantityButton({super.key, required this.cartProducts});

  final CartProductsModel cartProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (cartProducts.quantity > 1) {
                cartProducts.quantity = cartProducts.quantity - 1;
                context.read<CartCubit>().updateProductQuantity(cartProducts);
              }
            },
            icon: Icon(Icons.remove_circle, color: Colors.grey),
          ),
          SizedBox(
            width: 20,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(cartProducts.quantity.toString()),
            ),
          ),
          IconButton(
            onPressed: () {
              cartProducts.quantity = cartProducts.quantity + 1;
              context.read<CartCubit>().updateProductQuantity(cartProducts);
            },
            icon: Icon(Icons.add_circle, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
