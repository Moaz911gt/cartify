import 'package:flutter/material.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductstModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody(product: product)),
    );
  }
}
