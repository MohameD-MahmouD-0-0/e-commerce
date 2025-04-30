import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/add_to_wish_list_remote_datasource.dart';

import 'package:ecommerce/domain/entites/AddToWishListEntity.dart';

import 'package:ecommerce/domain/entites/failer.dart';

import '../../domain/reposatiory/add_to_wish_list_reposatiory_contract.dart';

class AddToWishListReposatioryImp implements AddToWishListReposatiortContract{
  AddToWishListRemoteDatasource addToWishListRemoteDatasource;
  AddToWishListReposatioryImp({required this.addToWishListRemoteDatasource});
  @override
  Future<Either<Failer, AddToWishListEntity>> addToWishList(String ProductID) {
    return addToWishListRemoteDatasource.addToWishList(ProductID);
  }

}