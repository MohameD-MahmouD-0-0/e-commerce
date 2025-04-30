import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';

import '../../../../domain/entites/AddToCartResponseEntity.dart';
import '../../../../domain/entites/AddToWishListEntity.dart';

abstract class ProdctState{}
class LodingProductState extends ProdctState{}
class ErrorProductState extends ProdctState{
  String errorMessage;
  ErrorProductState({required this.errorMessage});
}
class SuccsesProductState extends ProdctState{
  ProductResponseEntity productResponseEntity;

  SuccsesProductState({required this.productResponseEntity});
}
class SuccsesAddToCart extends ProdctState{
  AddToCartResponseEntity addToCartResponseEntity;

  SuccsesAddToCart({required this.addToCartResponseEntity});

}

class LodingAddToWishListState extends ProdctState{}

class ErrorAddToWishListState extends ProdctState{
  String errorMessage ;
  ErrorAddToWishListState({required this.errorMessage});

}
class SuccessAddToWishListState extends ProdctState{
  AddToWishListEntity addToWishListEntity;
  SuccessAddToWishListState({required this.addToWishListEntity});
}
