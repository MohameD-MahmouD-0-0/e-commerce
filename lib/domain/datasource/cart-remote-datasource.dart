import 'package:dartz/dartz.dart';
import '../entites/ResponseCartEntity.dart';
import '../entites/failer.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failer,ResponseCartEntity>> getCartItem();
}