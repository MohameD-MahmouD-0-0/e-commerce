// import 'package:ecommerce/domain/datasource/add_to_cart_use_case.dart';
// import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
// import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AddToCartViewModel extends Cubit<AddToCartState> {
//   int numOfCartItem = 0;
//   AddToCartUseCase addToCartUseCase;
//   AddToCartResponseEntity? addToCartResponseEntity;
//
//   static AddToCartViewModel get(context)=> BlocProvider.of(context);
//
//   AddToCartViewModel({required this.addToCartUseCase}) :
//         super(LodingAddToCart());
//   void addToCart(String prodcutId) async {
//     var either = await addToCartUseCase.invoke(prodcutId);
//     either.fold((l) {
//       emit(ErrorAddToCart(errorMessage: l.errorMessage));
//     }, (response) {
//       addToCartResponseEntity = response;
//       numOfCartItem = response.numOfCartItems! ;
//       print('number of cartITems = $numOfCartItem');
//       emit(SuccsesAddToCart(addToCartResponseEntity: response));
//     });
//   }
// }
