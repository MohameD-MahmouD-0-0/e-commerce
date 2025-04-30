import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/UpdateCartItemEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class UpdateCartItemReposatioryContract{
  Future<Either<Failer,UpdateCartItemEntity>> updateCart(String cartID,String Count);
}