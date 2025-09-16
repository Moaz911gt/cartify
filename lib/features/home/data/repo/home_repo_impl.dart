import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project2/core/service/data%20source/api_service.dart';
import 'package:project2/core/service/data%20source/failure.dart';
import 'package:project2/core/service/data%20source/sqldb.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<ProductstModel>>> getProducts() async {
    try {
      final Response response = await ApiService.get(path: 'products', query: null);
      List<ProductstModel> productsList = [];
      for (var i = 0; i < response.data.length; i++) {
        productsList.add(ProductstModel.fromJson(response.data[i]));
      }
      return right(productsList);
    } catch (e) {
      return left(Failure.defaultMessage());
    }
  }
  @override
  Future<int?> insertDataToCart({required CartProductsModel cartModel}) async {
    var res = await Sqldb.insertData(
      '''INSERT INTO cart (product_id,Pname,Pprice,Pimg,Pquantity) 
VALUES (?,?,?,?,?)
''',
      [
        cartModel.id,
        cartModel.title,
        cartModel.price,
        cartModel.image,
        cartModel.quantity,
      ],
    );
    return res;
  }


}
