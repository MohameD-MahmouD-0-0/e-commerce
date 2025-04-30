import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_manger.dart';
import 'package:ecommerce/domain/entites/AddToWishListEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import '../../../domain/datasource/add_to_wish_list_remote_datasource.dart';

class AddToWishListRemoteDataSourceImp implements  AddToWishListRemoteDatasource{
  ApiManger apiManger;
  AddToWishListRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer, AddToWishListEntity>> addToWishList(String ProductID)async {
    var either = await apiManger.addToWishList(ProductID);
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response){
      return Right(response.toEntity());
    });
  }

}