import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';

import '../entites/CategoryEntity.dart';
import '../entites/failer.dart';

abstract class BrandesRemoteDataSource {
  Future<Either<Failer, BrandesResponseEntity>> getAllBrandes();
}
