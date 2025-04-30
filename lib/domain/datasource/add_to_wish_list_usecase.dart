import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/add_to_wish_list_reposatiory_contract.dart';

import '../entites/AddToWishListEntity.dart';
import '../entites/failer.dart';

class AddToWishListUseCase{
  AddToWishListReposatiortContract addToWishListReposatiortContract;
  AddToWishListUseCase({required this.addToWishListReposatiortContract});
  Future<Either<Failer, AddToWishListEntity>> invoke(String ProductID){
    return addToWishListReposatiortContract.addToWishList(ProductID);
  }

}