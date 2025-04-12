import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/add_to_cart_remote_datasource.dart';
import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/add_to_cart_reposatiory_contract.dart';

 class AddToCartReposatioryImp implements AddToCartReposatioryContract{
  AddToCartRemoteDataSource addToCartRemoteDataSource;
  AddToCartReposatioryImp({required this.addToCartRemoteDataSource});
  Future<Either<Failer,AddToCartResponseEntity>>addToCart(String productId){
    return addToCartRemoteDataSource.addToCart(productId);
  }
}