import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.products});
  final CartProductsModel products;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        final isInCart = cubit.cartItems.any((item) => item.id == products.id);

        return IconButton(
          icon: Icon(
            FontAwesomeIcons.cartPlus,
            color: isInCart ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            cubit.addToCart(products);
          },
        );
      },
    );
  }
}
