import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/update_cart_item_reposatiory_contract.dart';

import '../entites/UpdateCartItemEntity.dart';
import '../entites/failer.dart';

class UpdateCartItemUseCase{
  UpdateCartItemReposatioryContract updateCartItemReposatioryContract;
  UpdateCartItemUseCase({required this.updateCartItemReposatioryContract});

  Future<Either<Failer, UpdateCartItemEntity>>invoke(String cartID,String Count){
    return updateCartItemReposatioryContract.updateCart(cartID, Count);
  }
}