import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';

import '../../../../domain/entites/AddToCartResponseEntity.dart';

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

