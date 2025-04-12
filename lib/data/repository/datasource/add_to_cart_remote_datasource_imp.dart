import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/domain/datasource/add_to_cart_remote_datasource.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

class AddToCartRemoteDataSourceImp implements AddToCartRemoteDataSource{
  ApiManger apiManger;
  AddToCartRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer, AddToCartResponseEntity>> addToCart(String productId) async {
    var either = await apiManger.addToCart(productId);
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response){
      return Right(response.toAddToCartResponseDto());
    });
  }

}