import 'package:ecommerce/domain/datasource/get-cart-item-usecase.dart';
import 'package:ecommerce/domain/datasource/update_cart_item_usecase.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/datasource/delete_cart_item_usecase.dart';

class GetCartItemViewModel extends Cubit<CartItemState> {
  GetCartItemUseCase getCartItemUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  UpdateCartItemUseCase updateCartItemUseCase;
  List<GetProductsCartItemEntity>? cartList = [];

  static GetCartItemViewModel get(context)=> BlocProvider.of(context);

  GetCartItemViewModel(
      {required this.getCartItemUseCase, required this.deleteCartItemUseCase,
        required this.updateCartItemUseCase})
      : super(LodingCartItemState());

  getCartItem() async {
    var either = await getCartItemUseCase.invoke();
    either.fold((l) {
      emit(ErrorCartItemStateState(errorMessage: l.errorMessage));
    }, (response) async {
      cartList = response.data!.products;
      emit(SuccsesCartItemStateState(cartEntity: response));
    });
  }
  deleteCartItem(String ProductID) async {
    emit(LodingDeleteCartItemState());
    var either = await deleteCartItemUseCase.invoke(ProductID);
    either.fold((l) {
      emit(ErrorDeleteCartItemState(errorMessage: l.errorMessage));
    }, (response) async {
      emit(SuccessDeleteCartItemState(DeletcartEntity: response));
      await getCartItem();
    });
  }
  updateCartItem(String ProductID, String count) async {
    emit(LodingUpdateCartItemState());
    var either = await updateCartItemUseCase.invoke(ProductID, count);
    either.fold((l) {
      emit(ErrorUpdateCartItemStateState(errorMessage: l.errorMessage));
    }, (response) async {
      await getCartItem();
      emit(SuccessesUpdateCartItemStateState(updateCartItemEntity: response));
    });
  }
}