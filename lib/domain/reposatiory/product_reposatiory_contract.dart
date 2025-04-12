import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';

import '../entites/failer.dart';

abstract class ProductReposatioryContract{
  Future<Either<Failer,ProductResponseEntity>> getAllProduct();
}