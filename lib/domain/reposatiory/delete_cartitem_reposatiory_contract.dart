import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class DeleteCartItemReposatioryContract{
  Future<Either<Failer,RemoveCartitemResponseEntity>>deleteItem(String ProductID);
}