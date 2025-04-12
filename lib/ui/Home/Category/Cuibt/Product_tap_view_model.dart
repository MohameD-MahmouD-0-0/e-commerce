import 'package:ecommerce/domain/datasource/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/datasource/prodcut_Usecase.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Prodcut_tap_state.dart';
import 'get_cart_item_state.dart';

class ProdcutTapViewModel extends Cubit<ProdctState> {
  ProductUseCase productuseCase;
  AddToCartUseCase addToCartUseCase;
  List<DataEntity>? prodcutList;
  int numOfCartItem = 0;
  AddToCartResponseEntity? addToCartResponseEntity;

  static ProdcutTapViewModel get(context) => BlocProvider.of(context);

  ProdcutTapViewModel(
      {required this.productuseCase, required this.addToCartUseCase})
      : super(LodingProductState());

    getAllProduct() async {
    var either = await productuseCase.invoke();
    either.fold((l) {
      emit(ErrorProductState(errorMessage: l.errorMessage));
    }, (response) {
      prodcutList = response.data;
      emit(SuccsesProductState(productResponseEntity: response));
    });
  }

   addToCart(String prodcutId) async {
    var either = await addToCartUseCase.invoke(prodcutId);
    either.fold((l) {
      emit(ErrorProductState(errorMessage: l.errorMessage));
    }, (response) {
      addToCartResponseEntity = response;
      numOfCartItem = response.numOfCartItems!;
      print('number of cartITems = $numOfCartItem');
      emit(SuccsesAddToCart(addToCartResponseEntity: response));
    });
  }
}
