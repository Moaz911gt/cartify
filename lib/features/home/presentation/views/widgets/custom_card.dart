import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/home/presentation/views/widgets/product_details_view.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.product});
  final ProductstModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  var cartItems=context.watch<CartCubit>().cartItems;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: ProductCubit()),
                BlocProvider.value(value: CartCubit()),
              ],
              child: ProductDetailsView(product: widget.product),
            ),
          ),
        );
      },
      child: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Color(0xffF7F7F7)),
                    width: double.infinity,
                    height: constraints.maxWidth * .8,
                    child: Hero(
                      tag: 'product${widget.product.id}',
                      child: Image.network(widget.product.image),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: -10,
                    child: Container(
                      height: size.height * .1,
                      width: size.width * .1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child:
                           Center(
                            child: IconButton(
                              onPressed: () {
                                addOrDeleteProduct(context);
                              },
                              icon: isInCart(cartItems)
                                  ? Icon(Icons.shopping_cart, color: Colors.red)
                                  : Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.grey,
                                    ),

                              iconSize: size.width * .05,
                            ),
                          ),
                        
                      ),
                  )
                ]
              ),
              SizedBox(height: size.height * .005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.title.substring(0, 12),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * .04,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                    children: [
                      Text(
                        widget.product.rating.rate.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.description,
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),

                  Text(
                    r'$'
                    '${widget.product.price}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  bool isInCart(cartItems) {
    for (var e in cartItems) {
      if (e.id == widget.product.id) {
        return true;
      }
    }
    return false;
  }

  addOrDeleteProduct(BuildContext context) async {
    for (var item in context.read<CartCubit>().cartItems) {
      if (item.id == widget.product.id) {
        context.read<CartCubit>().deleteProductFromCart(item.id);

        return;
      }
    }
    context.read<CartCubit>().addToCart(
      CartProductsModel(
        id: widget.product.id,
        title: widget.product.title,
        price: widget.product.price,
        image: widget.product.image,
      ),
    );
  }
}
