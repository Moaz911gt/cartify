import 'package:flutter/material.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/presentation/views/widgets/product_details_view.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.products});
  final ProductstModel products;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsView(product: products);
            },
          ),
        );
      },
      child: Row(
        children: [
          Image.network(products.image, width: size.width * .2),
          SizedBox(width: size.width*.03,),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    products.title,
                    style: TextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
