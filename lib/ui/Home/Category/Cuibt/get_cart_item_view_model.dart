import 'package:ecommerce/domain/datasource/get-cart-item-usecase.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartItemViewModel extends Cubit<CartItemState> {
GetCartItemUseCase getCartItemUseCase;
List<GetProductsCartItem>? cartList=[];
  GetCartItemViewModel({required this.getCartItemUseCase}):super(LodingCartItemState());

  getCartItem()async {
      var either = await getCartItemUseCase.invoke();
      either.fold((l) {
        emit(ErrorCartItemStateState(errorMessage: l.errorMessage));
      }, (response) {
        cartList = response.data!.products;
        print(response);
        print(response.data!.products!.length);
        print(response.data);
        emit(SuccsesCartItemStateState(cartEntity: response));
      });
    }

  }
