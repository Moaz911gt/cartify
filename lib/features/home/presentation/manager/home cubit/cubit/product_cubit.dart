import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/cart/data/model/cart_products_model.dart';
import 'package:project2/features/home/data/model/products_model.dart';
import 'package:project2/features/home/data/repo/home_repo_impl.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(conext) => BlocProvider.of(conext);

  List<ProductstModel>? allProductsModel;
  List<ProductstModel>? filterdProducts;
  List<CartProductsModel> cartItems = [];
  int counter = 1;
 

  Future<void> getProducts() async {
    emit(Productlooding());
    final result = await HomeRepoImpl().getProducts();

    result.fold(
      (failure) {
        emit(Productfailure(errmessage: failure.message));
      },
      (success) {
        allProductsModel = success as List<ProductstModel>?;
        emit(Productsuccess(model: success));
      },
    );
  }

  void filterByCategory({required String category}) {
    if (allProductsModel == null) return;
    if (category.isEmpty || category.toLowerCase() == 'all') {
      filterdProducts = null;
      emit(Productsuccess(model: allProductsModel!));
      return;
    } else {
      filterdProducts = allProductsModel!
          .where((product) => product.category == category)
          .toList();

      emit(Productsuccess(model: filterdProducts!));
    }
  }

  void increaseCounter() {
    counter++;
    emit(CounterIncreaseSuccess());
  }

  void decreaseCounter() {
    if (counter > 1) {
      counter--;
      emit(CounterDecreaseSuccess());
    }
  }
}

// void filterByCategory({required String category}) {
//   if (allProductsModel == null) return;

//   if (category.isEmpty || category.toLowerCase() == 'all') {
//     // عرض كل المنتجات
//     filterdProducts = null;
//     selectedCategory = null;
//     emit(Productsuccess(model: allProductsModel!));
//     return;
//   }

//   if (selectedCategory == category) {
//     filterdProducts = null;
//     selectedCategory = null;
//     emit(Productsuccess(model: allProductsModel!));
//   } else {
//     selectedCategory = category;
//     filterdProducts = allProductsModel!
//         .where((product) => product.category == category)
//         .toList();

//     emit(Productsuccess(model: filterdProducts!));
//   }
// }
