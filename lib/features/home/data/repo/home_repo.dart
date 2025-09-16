import 'package:dartz/dartz.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/home/data/model/products_model.dart';

abstract class HomeRepo {
  Future<Either <Failure,List<ProductstModel>>> getProducts();
  Future<int?> insertDataToCart({required CartProductsModel cartModel});


}