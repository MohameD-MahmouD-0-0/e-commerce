import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class DeleteCartItemRemoteDatasource{
  Future<Either<Failer,RemoveCartitemResponseEntity>>deleteItem(String ProductID);
}