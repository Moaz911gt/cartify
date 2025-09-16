
import 'package:project2/features/cart/data/model/cart_products_model.dart';

abstract class Repo {
  Future<int?> insertDataToCart({required CartProductsModel cartModel});
  Future<List<Map>?> readAllDataFromCart();
  Future<int?> updateProductQuantity({required CartProductsModel cartModel});
  Future<int?> deleteProductFromCart({required int productId});
  Future clearCart();


}
