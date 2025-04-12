import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class AddToCartReposatioryContract {
  Future<Either<Failer,AddToCartResponseEntity>>addToCart(String productId);
}