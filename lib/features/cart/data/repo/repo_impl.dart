import 'package:project2/core/service/data%20source/sqldb.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/data/repo/repo.dart';

class RepoImpl extends Repo {
  @override
  Future clearCart() async {
    await Sqldb.deleteData('''DELETE FROM cart''');
  }

  @override
  Future<int?> deleteProductFromCart({required int productId}) async {
    var res = await Sqldb.deleteData(
      '''DELETE FROM cart WHERE product_id = $productId''',
    );
    return res;
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

  @override
  Future<List<Map>?> readAllDataFromCart() async {
    var res = await Sqldb.readData('''SELECT * FROM cart''');
    return res;
  }

  @override
  Future<int?> updateProductQuantity({
    required CartProductsModel cartModel,
  }) async {

    var res = await Sqldb.updateData(
      '''UPDATE cart SET Pquantity=${cartModel.quantity} WHERE product_id=${cartModel.id}''',
    );

     

    return res;
  }
}
