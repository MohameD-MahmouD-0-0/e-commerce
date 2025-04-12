import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class CategoryReposatioryContract{
   Future<Either<Failer,CategoryEntity>>getAllCategory();
}