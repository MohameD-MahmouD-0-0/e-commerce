import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class GetWishListRemoteDatasource{
  Future<Either<Failer,GetWishListResponseEntity>> getWishList();
}