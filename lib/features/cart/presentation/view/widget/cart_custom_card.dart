import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/cart/presentation/view/widget/custom_quantity_buttons.dart';

class CartCustomCard extends StatelessWidget {
  const CartCustomCard({super.key, required this.cartProducts});
  final CartProductsModel cartProducts;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              height: 130,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(cartProducts.image),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      cartProducts.title.substring(0, 12),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        for (var item in context.read<CartCubit>().cartItems) {
                          if (item.id == cartProducts.id) {
                            context.read<CartCubit>().deleteProductFromCart(
                              item.id,
                            );
                            return;
                          }
                        }
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Text(' 4.2'),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SizedBox(
                    width: size.width * .45,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              r'$' + cartProducts.price.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        CustomQuantityButton(cartProducts: cartProducts),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
