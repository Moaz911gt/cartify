import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/functions/custom_snack_bar.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/cart/presentation/view/widget/cart_custom_card.dart';
import 'package:project2/features/cart/presentation/view/widget/check_out_body.dart';

class ProductsCartViewBody extends StatelessWidget {
  const ProductsCartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (BuildContext context, CartState state) {
        if (state is DeleteSuccess) {
          customSnackBar(context, 'deleted succesfully', Colors.red);
        } else if (state is Deletefailure) {
          customSnackBar(context, state.errmessage, Colors.red);
        }
      },
      builder: (context, stata) {
        var cartProducts = context.watch<CartCubit>().cartItems;
        if (stata is Readfailure) {
          return const Center(child: Text('error'));
        } else if (cartProducts.isEmpty) {
          return const Center(
            child: Text(
              'cart is empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
        //  final totalPrice = context.read<CartCubit>().getTotalPrice();
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CartCustomCard(cartProducts: cartProducts[index]),
                    );
                  },
                ),
              ),
            ),
            CheckOutBody(),
          ],
        );
      },
    );
  }
}
