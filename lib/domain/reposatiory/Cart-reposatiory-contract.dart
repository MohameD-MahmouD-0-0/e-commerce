import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class CartReposatioryContract {
  Future<Either<Failer,ResponseCartEntity>> getCartItem();
}