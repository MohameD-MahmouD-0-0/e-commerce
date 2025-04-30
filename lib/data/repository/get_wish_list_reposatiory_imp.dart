import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/get_wish_list_remote_datasource.dart';
import 'package:ecommerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/get_wish_list_reposatiory_contract.dart';

class GetWishListReposatioryImp implements GetWishListReposatioryContract{
  GetWishListRemoteDatasource getWishListRemoteDatasource;
  GetWishListReposatioryImp({required this.getWishListRemoteDatasource});
  @override
  Future<Either<Failer, GetWishListResponseEntity>> getWishList() {
    return getWishListRemoteDatasource.getWishList();
  }
}