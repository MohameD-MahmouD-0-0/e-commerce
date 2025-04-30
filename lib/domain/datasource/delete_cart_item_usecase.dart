import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/delete_cartitem_reposatiory_contract.dart';

import '../entites/RemoveCartitemResponseEntity.dart';
import '../entites/failer.dart';

class DeleteCartItemUseCase{
  DeleteCartItemReposatioryContract deleteCartItemReposatioryContract;
  DeleteCartItemUseCase({required this.deleteCartItemReposatioryContract});

  Future<Either<Failer, RemoveCartitemResponseEntity>> invoke(String ProductID){
    return deleteCartItemReposatioryContract.deleteItem(ProductID);
  }
}