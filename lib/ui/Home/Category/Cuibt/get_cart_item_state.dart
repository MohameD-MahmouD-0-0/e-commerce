import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';

import '../../../../domain/entites/AddToCartResponseEntity.dart';
import '../../../../domain/entites/UpdateCartItemEntity.dart';

abstract class CartItemState{}
class LodingCartItemState extends CartItemState{}
class ErrorCartItemStateState extends CartItemState{
  String errorMessage;
  ErrorCartItemStateState({required this.errorMessage});
}
class SuccsesCartItemStateState extends CartItemState{
  ResponseCartEntity cartEntity;
  SuccsesCartItemStateState({required this.cartEntity});
}

class LodingDeleteCartItemState extends CartItemState{}

class ErrorDeleteCartItemState extends CartItemState{
  String errorMessage;
  ErrorDeleteCartItemState({required this.errorMessage});
}
class SuccessDeleteCartItemState extends CartItemState{
  RemoveCartitemResponseEntity DeletcartEntity;
  SuccessDeleteCartItemState({required this.DeletcartEntity});
}
class LodingUpdateCartItemState extends CartItemState{}
class ErrorUpdateCartItemStateState extends CartItemState{
  String errorMessage;
  ErrorUpdateCartItemStateState({required this.errorMessage});
}
class SuccessesUpdateCartItemStateState extends CartItemState{
  UpdateCartItemEntity updateCartItemEntity;
  SuccessesUpdateCartItemStateState({required this.updateCartItemEntity});
}
