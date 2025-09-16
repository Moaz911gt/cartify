import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/cart/data/repo/repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartProductsModel> cartItems = [];
  addToCart(CartProductsModel cartModel) async {
    try {
      await RepoImpl().insertDataToCart(cartModel: cartModel);
      cartItems.add(cartModel);
      emit(AddSuccess());
    } catch (e) {
      emit(Addfailure(errmessage: e.toString()));
    }
  }

  deleteProductFromCart(int productId) async {
    try {
      await RepoImpl().deleteProductFromCart(productId: productId);
      cartItems.remove(
        cartItems.where((e) => e.id == productId).toList().first,
      );

      emit(DeleteSuccess());
    } catch (e) {
      emit(Deletefailure(errmessage: e.toString()));
    }
  }

  updateProductQuantity(CartProductsModel cartModel) async {
    try {
      await RepoImpl().updateProductQuantity(cartModel: cartModel);
      cartItems = cartItems.map((e) {
        if (e.id == cartModel.id) {
          e.quantity = cartModel.quantity;
        } else {
          e;
        }
        return e;
      }).toList();
      emit(UpdateSuccess());
    } catch (e) {
      emit(Updatefailure(errmessage: e.toString()));
    }
  }

  readCart() async {
    try {
      var res = await RepoImpl().readAllDataFromCart();

      cartItems =
          res?.map((e) {
            return CartProductsModel.fromJson(e);
          }).toList() ??
          [];

      emit(ReadSuccess());
    } catch (e) {
      emit(Readfailure(errmessage: e.toString()));
    }
  }

  clearCart() async {
    try {
      await RepoImpl().clearCart();
      cartItems = [];
      emit(DeleteSuccess());
    } catch (e) {
      emit(Deletefailure(errmessage: e.toString()));
    }
  }

  // double getTotalPrice() {
  //   double total = 0;
  //   for (var item in cartItems) {
  //     final unitPrice = (item.price is num);

  //     total += item.price * item.quantity;
  //   }
  //   return total;
  // }
}
