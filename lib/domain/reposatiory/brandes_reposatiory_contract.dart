import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class BrandesReposatioryContract{
  Future<Either<Failer,BrandesResponseEntity>>getAllBrandes();
}