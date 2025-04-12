import 'package:dartz/dartz.dart';
import '../entites/ProductResponseEntity.dart';
import '../entites/failer.dart';

abstract class ProductRemoteDatasource{
  Future<Either<Failer,ProductResponseEntity>> getAllProduct();
}