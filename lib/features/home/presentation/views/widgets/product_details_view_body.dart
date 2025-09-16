import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/functions/custom_snack_bar.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/presentation/views/widgets/alert_dialog.dart';
import 'package:project2/features/home/presentation/views/widgets/counter_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductstModel product;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddSuccess) {
          customSnackBar(context, 'added success', Colors.green);
        } else if (state is Addfailure) {
          customSnackBar(context, 'failure', Colors.red);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xff232C33)),
              width: 600,
              height: 200,
              child: Hero(
                tag: 'product${product.id}',
                child: Image.network(product.image),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Column(
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        product.category,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        r'$'
                        '${product.price.toString()}',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialogMessage(
                              onConfirm: () {
                                addProduct(context, cubit);
                              },
                            ),
                          );

                          // Navigator.pop(context,context.read<CartCubit>().readCart());
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      CounterWidget(),
                    ],
                  ),
                  Text(product.description, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  addProduct(BuildContext context, CartCubit cubit) async {
    cubit.addToCart(
      CartProductsModel(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        // quantity: cubit.counter,
      ),
    );
  }
}
