import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/get_wish_list_reposatiory_contract.dart';
import '../entites/GetWishListResponseEntity.dart';
import '../entites/failer.dart';

class GetWishListUseCase{
  GetWishListReposatioryContract getWishListReposatioryContract;
  GetWishListUseCase({required this.getWishListReposatioryContract});
  Future<Either<Failer, GetWishListResponseEntity>>  invoke(){
    return getWishListReposatioryContract.getWishList();
  }
}