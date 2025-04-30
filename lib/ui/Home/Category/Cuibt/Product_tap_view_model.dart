import 'package:ecommerce/domain/datasource/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/datasource/add_to_wish_list_usecase.dart';
import 'package:ecommerce/domain/datasource/prodcut_Usecase.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Prodcut_tap_state.dart';

class ProdcutTapViewModel extends Cubit<ProdctState> {
  Set<String> wishlistIds = {};
  ProductUseCase productuseCase;
  AddToCartUseCase addToCartUseCase;
  List<DataEntity>? prodcutList;
  AddToWishListUseCase wishListUseCase;
  int numOfCartItem = 0;
  AddToCartResponseEntity? addToCartResponseEntity;
  List<String> isWishList = [];

  static ProdcutTapViewModel get(context) => BlocProvider.of(context);

  ProdcutTapViewModel(
      {required this.productuseCase,
      required this.addToCartUseCase,
      required this.wishListUseCase})
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

  addToWishList(String productId) async {
    emit(LodingAddToWishListState());
    var either = await wishListUseCase.invoke(productId);
    either.fold((l) {
      emit(ErrorAddToWishListState(errorMessage: l.errorMessage));
    }, (response) async {
      wishlistIds.contains(productId)
          ? wishlistIds.remove(productId)
          : wishlistIds.add(productId);
      isWishList = response.data!;
      emit(SuccessAddToWishListState(addToWishListEntity: response));
    });
  }
}
