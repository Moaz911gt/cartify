import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/features/home/data/model/products_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<ProductstModel> products = [];

  searchProducts({required String productName}) {
    emit(SearchLooding());
    List<ProductstModel> filterdproducts = [];
    for (var p in products) {
      if (p.title.toLowerCase().contains(productName.toLowerCase())) {
        filterdproducts.add(p);
      }
    }
    emit(SearchSuccess(productsModel: filterdproducts));
  }
}
