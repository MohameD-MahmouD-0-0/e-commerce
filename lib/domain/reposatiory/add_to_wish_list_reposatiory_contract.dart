import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/AddToWishListEntity.dart';
import '../entites/failer.dart';

abstract class AddToWishListReposatiortContract{
  Future<Either<Failer, AddToWishListEntity>> addToWishList(String ProductID);
}