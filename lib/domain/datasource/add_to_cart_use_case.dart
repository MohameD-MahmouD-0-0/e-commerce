import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/add_to_cart_reposatiory_contract.dart';

class AddToCartUseCase {
  AddToCartReposatioryContract addToCartReposatioryContract;
  AddToCartUseCase({required this.addToCartReposatioryContract});
  Future<Either<Failer,AddToCartResponseEntity>> invoke(String productId){
    return addToCartReposatioryContract.addToCart(productId);
  }
}