import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductCubit>();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          width: 150,
          child: Row(
            children: [
              Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (cubit.counter > 1) {
                        cubit.decreaseCounter();
                      }
                      // if (cartProducts.quantity > 1) {
                      //   cartProducts.quantity =
                      //       cartProducts.quantity - 1;
                      //   context
                      //       .read<CartCubit>()
                      //       .updateProductQuantity(cartProducts);
                      // }
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.grey),
                  ),
                  Text(cubit.counter.toString()),
                  IconButton(
                    onPressed: () {
                      cubit.increaseCounter();

                      // cartProducts.quantity =
                      //     cartProducts.quantity + 1;
                      // context
                      //     .read<CartCubit>()
                      //     .updateProductQuantity(cartProducts);
                    },
                    icon: Icon(Icons.add_circle, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
