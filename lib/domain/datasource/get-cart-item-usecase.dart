import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/Cart-reposatiory-contract.dart';
import '../entites/ResponseCartEntity.dart';
import '../entites/failer.dart';

class GetCartItemUseCase {
  CartReposatioryContract cartReposatioryContract;
  GetCartItemUseCase({required this.cartReposatioryContract});
  Future<Either<Failer, ResponseCartEntity>>invoke(){
    return cartReposatioryContract.getCartItem();
  }
}